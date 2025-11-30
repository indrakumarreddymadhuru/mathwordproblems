import Foundation

enum Difficulty: String, Codable, CaseIterable, Identifiable {
    case easy
    case medium
    case hard

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .easy: return "Easy"
        case .medium: return "Medium"
        case .hard: return "Hard"
        }
    }

    var jsonFileName: String {
        switch self {
        case .easy: return "easyProblems"
        case .medium: return "mediumProblems"
        case .hard: return "hardProblems"
        }
    }
}

struct Problem: Identifiable, Codable {
    let id: UUID
    let problem: String
    let answers: [Int]
    let correct: Int
    let explanation: String
    let emoji: String

    init(id: UUID = UUID(),
         problem: String,
         answers: [Int],
         correct: Int,
         explanation: String,
         emoji: String) {
        self.id = id
        self.problem = problem
        self.answers = answers
        self.correct = correct
        self.explanation = explanation
        self.emoji = emoji
    }
}

import SwiftUI

// Sample data
let sampleProblem = Problem(
    problem: "What is 2 + 2?",
    answers: [2, 3, 4, 5],
    correct: 2, // index of 4 in answers
    explanation: "2 plus 2 is 4.",
    emoji: "🧮"
)

// Minimal SwiftUI view for preview
struct ProblemPreviewView: View {
    let problem: Problem
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(problem.emoji).font(.largeTitle)
            Text(problem.problem).font(.headline)
            ForEach(Array(problem.answers.enumerated()), id: \.offset) { index, answer in
                HStack {
                    Text("\(answer)")
                    if index == problem.correct {
                        Text("✔️").foregroundColor(.green)
                    }
                }
            }
            Text("Explanation: \(problem.explanation)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ProblemPreviewView(problem: sampleProblem)
}

struct HomeScreenPreview: View {
    var solvedCount: Int = 0
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 122/255, green: 120/255, blue: 255/255), Color(red: 159/255, green: 73/255, blue: 255/255)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 28) {
                // Header
                HStack {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 48, height: 48)
                        .overlay(Image(systemName: "xmark").font(.title2).foregroundColor(.white))
                    Spacer()
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 48, height: 48)
                        .overlay(Image(systemName: "arrow.down.to.line").font(.title2).foregroundColor(.white))
                }
                .padding(.horizontal)
                
                // Title
                VStack(spacing: 8) {
                    HStack {
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
                
                // Solved count card
                VStack(spacing: 6) {
                    Text("Problems Solved Today")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Text("\(solvedCount)")
                        .font(.system(size: 38, weight: .bold, design: .rounded))
                        .foregroundColor(Color.yellow)
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color.white.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 26).stroke(Color.white.opacity(0.3), lineWidth: 2))
                .padding(.horizontal, 32)
                
                // Difficulty buttons
                VStack(spacing: 22) {
                    DifficultyButton(title: "Easy", emoji: "🌟", color: Color.green)
                    DifficultyButton(title: "Medium", emoji: "⭐️", color: Color.orange)
                    DifficultyButton(title: "Hard", emoji: "🔥", color: Color.red)
                }
                .padding(.top, 8)
                .padding(.horizontal, 8)
                
                Spacer()
                
                // Progress button
                Button(action: {}) {
                    HStack {
                        Text("📊")
                        Text("View My Progress")
                            .fontWeight(.semibold)
                    }
                    .font(.title3)
                    .padding(.vertical, 14)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white.opacity(0.5), lineWidth: 2))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 18)
                .padding(.bottom, 18)
            }
        }
    }
}

struct DifficultyButton: View {
    let title: String
    let emoji: String
    let color: Color
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 12) {
                Text(emoji)
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
        .padding(.horizontal, 8)
        .shadow(color: color.opacity(0.25), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    HomeScreenPreview(solvedCount: 0)
}
