import SwiftUI
import Combine
struct DifficultySelectionView: View {
    @ObservedObject var progressTracker = ProgressTracker.shared
    @State private var showProgress = false

    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 122/255, green: 120/255, blue: 255/255),
                        Color(red: 159/255, green: 73/255, blue: 255/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 28) {
                    // Header
                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            Text("🎓")
                Text("Math Word Problems")
                                .font(.system(size: 32, weight: .bold))
                        }
                        .foregroundColor(.white)
                        
                        Text("Let's practice math together!")
                            .font(.title3)
                            .foregroundColor(.white)
                            .opacity(0.85)
                    }
                    .padding(.top, 40)

                    // Problems Solved Today Card
                    VStack(spacing: 6) {
                        Text("Problems Solved Today")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("\(progressTracker.progress.problemsSolvedToday)")
                            .font(.system(size: 38, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .stroke(Color.white.opacity(0.3), lineWidth: 2)
                    )
                    .padding(.horizontal, 32)
                    
                    // Difficulty buttons
                    VStack(spacing: 22) {
                        ForEach(Difficulty.allCases) { level in
                            NavigationLink(destination: ProblemView<GameViewModel>(viewModel: GameViewModel(difficulty: level))) {
                                HStack(spacing: 12) {
                                    Text(emojiForDifficulty(level))
                                    Text(level.displayName)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity)
                                .background(color(for: level))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                            }
                            .padding(.horizontal, 8)
                            .shadow(color: color(for: level).opacity(0.25), radius: 6, x: 0, y: 3)
                        }
                    }
                    .padding(.top, 8)

                Spacer()
                    
                    // View My Progress button
                    Button(action: {
                        showProgress = true
                    }) {
                        HStack {
                            Image(systemName: "chart.bar.fill")
                            Text("View My Progress")
                                .fontWeight(.semibold)
                        }
                        .font(.title3)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                        )
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 18)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .sheet(isPresented: $showProgress) {
                NavigationView {
                    MyProgressView()
                }
            }
        }
    }
    
    private func emojiForDifficulty(_ difficulty: Difficulty) -> String {
        switch difficulty {
        case .easy: return "🌟"
        case .medium: return "⭐️"
        case .hard: return "🔥"
        }
    }

    private func color(for difficulty: Difficulty) -> Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
}

#Preview {
    DifficultySelectionView()
}

