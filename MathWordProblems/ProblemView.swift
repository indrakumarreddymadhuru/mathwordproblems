import SwiftUI

struct ProblemView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if viewModel.sessionFinished {
                    VStack(spacing: 8) {
                        Text("Great work!")
                            .font(.title)
                            .padding(.top)

                        Text("You answered \(viewModel.correctCount) out of \(viewModel.totalAttempts) correctly.")
                            .font(.headline)

                        Button("Play Again") {
                            viewModel.startNewSession()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)

                        Button("Back to Home") {
                            dismiss()
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                } else if let problem = viewModel.currentProblem {
                    Text(problem.emoji)
                        .font(.system(size: 56))

                    Text(problem.problem)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()

                    VStack(spacing: 8) {
                        ForEach(problem.answers.indices, id: \.self) { index in
                            Button {
                                viewModel.selectAnswer(at: index)
                            } label: {
                                Text("\(problem.answers[index])")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(12)
                            }
                            .disabled(viewModel.showFeedback)
                        }
                    }
                    .padding(.horizontal)

                    if viewModel.showFeedback {
                        Text(viewModel.isCorrectAnswer ? "✅ Correct!" : "❌ Try again")
                            .font(.headline)
                            .padding(.top, 8)

                        Text(viewModel.explanationText)
                            .font(.subheadline)
                            .padding(.horizontal)

                        Button("Next") {
                            viewModel.goToNextProblem()
                        }
                        .padding(.top, 8)
                    }

                    Text("Score: \(viewModel.correctCount) / \(viewModel.totalAttempts)")
                        .font(.subheadline)
                        .padding(.top, 8)

                    Spacer()
                } else {
                    Text("No problems available.")
                    Button("Close") { dismiss() }
                }
            }
            .padding()
            .navigationBarTitle(viewModel.difficulty.displayName, displayMode: .inline)
            .navigationBarItems(leading: Button("Close") { dismiss() })
        }
    }
}

