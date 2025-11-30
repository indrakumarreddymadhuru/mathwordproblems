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

