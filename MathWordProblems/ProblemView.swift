import SwiftUI

struct ProblemView<ViewModel: GameViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
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

                    HStack(spacing: 16) {
                        if viewModel.hasPreviousProblem {
                            Button("Previous") {
                                viewModel.goToPreviousProblem()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.primary)
                            .cornerRadius(12)
                        }
                        
                        if viewModel.hasNextProblem {
                        Button("Next") {
                            viewModel.goToNextProblem()
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        } else {
                            Button("Finish") {
                                viewModel.goToNextProblem()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                        .padding(.top, 8)
                    }

                    Text("Score: \(viewModel.correctCount) / \(viewModel.totalAttempts)")
                        .font(.subheadline)
                        .padding(.top, 8)

                    Spacer()
                } else {
                    Text("No problems available.")
                Button("Back") { dismiss() }
                }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.difficulty.displayName)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("\(viewModel.correctCount) / \(viewModel.totalAttempts)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
    }
}

// Protocol for game view model to support previews
protocol GameViewModelProtocol: ObservableObject {
    var difficulty: Difficulty { get }
    var currentProblem: Problem? { get }
    var correctCount: Int { get set }
    var totalAttempts: Int { get set }
    var showFeedback: Bool { get set }
    var isCorrectAnswer: Bool { get set }
    var explanationText: String { get set }
    var sessionFinished: Bool { get set }
    var hasPreviousProblem: Bool { get }
    var hasNextProblem: Bool { get }
    func selectAnswer(at index: Int)
    func goToNextProblem()
    func goToPreviousProblem()
    func startNewSession()
}

// Make GameViewModel conform to the protocol
extension GameViewModel: GameViewModelProtocol {}

// MARK: - Previews

#Preview("Problem View - Active") {
    let sampleProblem = Problem(
        problem: "Sarah has 15 apples. She gives away 7 apples to her friends. How many apples does Sarah have left?",
        answers: [6, 7, 8, 9],
        correct: 2, // index of 8
        explanation: "Sarah started with 15 apples and gave away 7. So we calculate: 15 - 7 = 8 apples remaining.",
        emoji: "🍎"
    )
    
    let previewViewModel = PreviewGameViewModel(difficulty: .easy, problem: sampleProblem)
    return ProblemView(viewModel: previewViewModel)
}

#Preview("Problem View - With Feedback") {
    let sampleProblem = Problem(
        problem: "Tom has 20 stickers. He buys 5 more. How many stickers does Tom have now?",
        answers: [23, 24, 25, 26],
        correct: 2, // index of 25
        explanation: "Tom started with 20 stickers and bought 5 more. So we calculate: 20 + 5 = 25 stickers total.",
        emoji: "⭐️"
    )
    
    let previewViewModel = PreviewGameViewModel(difficulty: .medium, problem: sampleProblem)
    previewViewModel.showFeedback = true
    previewViewModel.isCorrectAnswer = true
    previewViewModel.explanationText = sampleProblem.explanation
    previewViewModel.totalAttempts = 1
    previewViewModel.correctCount = 1
    
    return ProblemView(viewModel: previewViewModel)
}

#Preview("Problem View - Finished") {
    let previewViewModel = PreviewGameViewModel(difficulty: .hard, problem: nil)
    previewViewModel.sessionFinished = true
    previewViewModel.correctCount = 8
    previewViewModel.totalAttempts = 10
    
    return ProblemView(viewModel: previewViewModel)
}

// Preview helper class for SwiftUI previews
class PreviewGameViewModel: ObservableObject, GameViewModelProtocol {
    @Published var difficulty: Difficulty
    @Published var allProblems: [Problem] = []
    @Published var sessionProblems: [Problem] = []
    @Published var currentIndex: Int = 0
    @Published var currentProblem: Problem?
    @Published var correctCount: Int = 0
    @Published var totalAttempts: Int = 0
    @Published var showFeedback: Bool = false
    @Published var isCorrectAnswer: Bool = false
    @Published var explanationText: String = ""
    @Published var sessionFinished: Bool = false
    
    let sessionSize: Int = 10
    
    var hasPreviousProblem: Bool {
        return currentIndex > 0
    }
    
    var hasNextProblem: Bool {
        return currentIndex + 1 < sessionProblems.count
    }
    
    init(difficulty: Difficulty, problem: Problem?) {
        self.difficulty = difficulty
        if let problem = problem {
            self.allProblems = [problem]
            self.sessionProblems = [problem]
            self.currentProblem = problem
        }
    }
    
    func startNewSession() {
        // Preview implementation - no-op
    }
    
    func selectAnswer(at index: Int) {
        // Preview implementation - no-op
    }
    
    func goToNextProblem() {
        // Preview implementation - no-op
    }
    
    func goToPreviousProblem() {
        // Preview implementation - no-op
    }
}

