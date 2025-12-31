import SwiftUI
import Combine
struct MyProgressView: View {
    @ObservedObject var progressTracker = ProgressTracker.shared
    @Environment(\.dismiss) var dismiss
    @State private var showWrongQuestions = false
    
    var body: some View {
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
            
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    HStack {
                        Button("← Back") {
                            dismiss()
                        }
                        .foregroundColor(.white)
                        .font(.headline)
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.white)
                            Text("My Progress")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Spacer for balance
                        Text("← Back")
                            .foregroundColor(.clear)
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Statistics Cards
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            StatCard(
                                value: "\(progressTracker.progress.problemsSolvedToday)",
                                label: "Today's Problems",
                                color: .yellow
                            )
                            
                            StatCard(
                                value: "\(progressTracker.progress.correctToday)",
                                label: "Correct Today",
                                color: .yellow
                            )
                        }
                        
                        HStack(spacing: 16) {
                            StatCard(
                                value: String(format: "%.0f%%", progressTracker.progress.accuracy),
                                label: "Accuracy",
                                color: .yellow
                            )
                            
                            StatCard(
                                value: "\(progressTracker.progress.dayStreak)",
                                label: "Day Streak 🔥",
                                color: .yellow
                            )
                        }
                        
                        // Wrong Questions - Clickable (full width)
                        Button(action: {
                            showWrongQuestions = true
                        }) {
                            StatCard(
                                value: "\(progressTracker.wrongProblemsCount)",
                                label: "Wrong Questions ❌",
                                color: .red
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // Performance by Level
                    VStack(spacing: 12) {
                        Text("Performance by Level")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                        
                        ForEach(Difficulty.allCases) { difficulty in
                            LevelPerformanceRow(difficulty: difficulty)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.3), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    
                    // Progress Bar for Today's Goal
                    VStack(spacing: 8) {
                        Text("Today's Goal Progress (10 problems)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // Background
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.white.opacity(0.3))
                                    .frame(height: 12)
                                
                                // Progress fill
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.green, .yellow]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(
                                        width: min(
                                            geometry.size.width * CGFloat(progressTracker.progress.problemsSolvedToday) / 10.0,
                                            geometry.size.width
                                        ),
                                        height: 12
                                    )
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white.opacity(0.4), lineWidth: 2)
                            )
                        }
                        .frame(height: 12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Back to Home button
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Back to Home")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [.green, Color.green.opacity(0.8)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    Spacer(minLength: 40)
                }
                .padding(.vertical)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showWrongQuestions) {
            WrongQuestionsView()
        }
    }
}

struct StatCard: View {
    let value: String
    let label: String
    let color: Color
    var icon: String? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 4) {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                Text(value)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(color)
            }
            
            Text(label)
                .font(.subheadline)
                .foregroundColor(.white)
                .opacity(0.9)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
    }
}

struct LevelPerformanceRow: View {
    let difficulty: Difficulty
    @ObservedObject var progressTracker = ProgressTracker.shared
    
    var body: some View {
        let stats = progressTracker.progress.getStats(for: difficulty)
        
        HStack {
            // Emoji and level name
            HStack(spacing: 8) {
                Text(emojiForDifficulty)
                    .font(.title3)
                Text(difficulty.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Stats (just like HTML: "0/0")
            Text("\(stats.correct)/\(stats.total)")
                .font(.headline)
                .foregroundColor(.yellow)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(Color.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private var emojiForDifficulty: String {
        switch difficulty {
        case .easy: return "🌟"
        case .medium: return "⭐"
        case .hard: return "🔥"
        }
    }
}

#Preview {
    MyProgressView()
}

