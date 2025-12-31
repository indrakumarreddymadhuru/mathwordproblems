import SwiftUI

struct WrongQuestionsView: View {
    @ObservedObject var progressTracker = ProgressTracker.shared
    @Environment(\.dismiss) var dismiss
    
    init() {
        // Ensure smooth scrolling
        UIScrollView.appearance().bounces = true
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Button("← Back") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Text("❌ Wrong Questions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(progressTracker.wrongProblemsCount) questions")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    // Spacer for balance
                    Text("← Back")
                        .foregroundColor(.clear)
                        .font(.headline)
                }
                .padding(.horizontal)
                .padding(.top)
                
                if progressTracker.progress.wrongProblems.isEmpty {
                    // Empty state
                    VStack(spacing: 16) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 64))
                            .foregroundColor(.green)
                        
                        Text("No Wrong Questions!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Great job! You haven't answered any questions incorrectly yet.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 60)
                    .frame(maxWidth: .infinity)
                } else {
                    // List of wrong questions - Use VStack for proper scrolling
                    VStack(spacing: 16) {
                        ForEach(progressTracker.progress.wrongProblems) { problem in
                            WrongQuestionCard(problem: problem)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Clear wrong questions button
                if !progressTracker.progress.wrongProblems.isEmpty {
                    Button(action: {
                        progressTracker.clearWrongQuestions()
                    }) {
                        HStack {
                            Image(systemName: "trash")
                            Text("Clear Wrong Questions")
                                .fontWeight(.semibold)
                        }
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                
                // Bottom padding to ensure last item is fully visible
                Spacer(minLength: 40)
            }
            .padding(.vertical)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 122/255, green: 120/255, blue: 255/255),
                    Color(red: 159/255, green: 73/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .navigationBarHidden(true)
    }
}

struct WrongQuestionCard: View {
    let problem: Problem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Emoji and problem
            HStack(alignment: .top, spacing: 12) {
                Text(problem.emoji)
                    .font(.system(size: 32))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(problem.problem)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Show correct answer
                    HStack(spacing: 8) {
                        Text("Correct Answer:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("\(problem.answers[problem.correct])")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
            }
            
            Divider()
                .background(Color.gray.opacity(0.3))
            
            // Explanation
            VStack(alignment: .leading, spacing: 4) {
                Text("Explanation:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Text(problem.explanation)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    WrongQuestionsView()
}

