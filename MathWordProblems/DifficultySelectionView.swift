import SwiftUI

struct DifficultySelectionView: View {
    @State private var selectedDifficulty: Difficulty?

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Math Word Problems")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("Choose your level")
                    .font(.title3)

                ForEach(Difficulty.allCases) { level in
                    Button {
                        selectedDifficulty = level
                    } label: {
                        Text(level.displayName)
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(color(for: level))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 32)
                }

                Spacer()
            }
            .sheet(item: $selectedDifficulty) { difficulty in
                ProblemView(viewModel: GameViewModel(difficulty: difficulty))
            }
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

