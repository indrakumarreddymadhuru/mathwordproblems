import Foundation
import Combine

// Progress data model
struct ProgressData: Codable {
    var problemsSolvedToday: Int = 0
    var correctToday: Int = 0
    var totalAttemptsToday: Int = 0
    var lastSessionDate: Date?
    var dayStreak: Int = 0
    
    // Performance by level
    var easyCorrect: Int = 0
    var easyTotal: Int = 0
    var mediumCorrect: Int = 0
    var mediumTotal: Int = 0
    var hardCorrect: Int = 0
    var hardTotal: Int = 0
    
    // Track wrong questions by problem ID
    var wrongQuestionIds: [UUID] = []
    
    // Store wrong problems with full data for display
    var wrongProblems: [Problem] = []
    
    var accuracy: Double {
        guard totalAttemptsToday > 0 else { return 0.0 }
        return Double(correctToday) / Double(totalAttemptsToday) * 100.0
    }
    
    func accuracy(for difficulty: Difficulty) -> Double {
        let (correct, total) = getStats(for: difficulty)
        guard total > 0 else { return 0.0 }
        return Double(correct) / Double(total) * 100.0
    }
    
    func getStats(for difficulty: Difficulty) -> (correct: Int, total: Int) {
        switch difficulty {
        case .easy:
            return (easyCorrect, easyTotal)
        case .medium:
            return (mediumCorrect, mediumTotal)
        case .hard:
            return (hardCorrect, hardTotal)
        }
    }
}

// Progress tracker singleton
class ProgressTracker: ObservableObject {
    @Published var progress: ProgressData
    
    static let shared = ProgressTracker()
    
    private let userDefaults = UserDefaults.standard
    private let progressKey = "MathWordProblemsProgress"
    private let lastDateKey = "MathWordProblemsLastDate"
    
    private init() {
        // Load saved progress
        if let data = userDefaults.data(forKey: progressKey),
           let decoded = try? JSONDecoder().decode(ProgressData.self, from: data) {
            self.progress = decoded
        } else {
            self.progress = ProgressData()
        }
        
        // Check if we need to reset daily stats
        checkAndResetDailyStats()
    }
    
    // Check if it's a new day and reset daily stats if needed
    private func checkAndResetDailyStats() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        if let lastDate = progress.lastSessionDate {
            let lastDay = calendar.startOfDay(for: lastDate)
            
            if today > lastDay {
                // Check if it's consecutive days for streak
                let daysDifference = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0
                
                if daysDifference == 1 {
                    // Consecutive day - increment streak
                    progress.dayStreak += 1
                } else if daysDifference > 1 {
                    // Streak broken - reset to 1
                    progress.dayStreak = 1
                }
                // If daysDifference == 0, it's the same day, keep streak
                
                // Reset daily stats
                progress.problemsSolvedToday = 0
                progress.correctToday = 0
                progress.totalAttemptsToday = 0
            }
        } else {
            // First time - start streak
            progress.dayStreak = 1
        }
        
        progress.lastSessionDate = Date()
        save()
    }
    
    // Record a problem attempt
    func recordAttempt(difficulty: Difficulty, isCorrect: Bool) {
        progress.totalAttemptsToday += 1
        progress.problemsSolvedToday += 1
        
        if isCorrect {
            progress.correctToday += 1
        }
        
        // Update level-specific stats
        switch difficulty {
        case .easy:
            easyTotal += 1
            if isCorrect {
                easyCorrect += 1
            }
        case .medium:
            mediumTotal += 1
            if isCorrect {
                mediumCorrect += 1
            }
        case .hard:
            hardTotal += 1
            if isCorrect {
                hardCorrect += 1
            }
        }
        
        save()
    }
    
    // Update level-specific stats (for backward compatibility)
    private var easyCorrect: Int {
        get { progress.easyCorrect }
        set { progress.easyCorrect = newValue }
    }
    
    private var easyTotal: Int {
        get { progress.easyTotal }
        set { progress.easyTotal = newValue }
    }
    
    private var mediumCorrect: Int {
        get { progress.mediumCorrect }
        set { progress.mediumCorrect = newValue }
    }
    
    private var mediumTotal: Int {
        get { progress.mediumTotal }
        set { progress.mediumTotal = newValue }
    }
    
    private var hardCorrect: Int {
        get { progress.hardCorrect }
        set { progress.hardCorrect = newValue }
    }
    
    private var hardTotal: Int {
        get { progress.hardTotal }
        set { progress.hardTotal = newValue }
    }
    
    // Save progress to UserDefaults
    private func save() {
        if let encoded = try? JSONEncoder().encode(progress) {
            userDefaults.set(encoded, forKey: progressKey)
        }
    }
    
    // Record wrong question
    func recordWrongQuestion(problemId: UUID, problem: Problem) {
        // Check if already tracked
        if !progress.wrongQuestionIds.contains(problemId) {
            progress.wrongQuestionIds.append(problemId)
            progress.wrongProblems.append(problem)
            print("✅ Added wrong question to tracking: \(problemId)")
            print("📊 Total wrong questions: \(progress.wrongQuestionIds.count)")
            save()
        } else {
            print("⚠️ Question already tracked: \(problemId)")
        }
    }
    
    // Get wrong problems count
    var wrongProblemsCount: Int {
        return progress.wrongProblems.count
    }
    
    // Get wrong problems list - computed property for easy access
    var wrongProblems: [Problem] {
        return progress.wrongProblems
    }
    
    // Get wrong problems list (alternative method name)
    var getWrongProblems: [Problem] {
        return progress.wrongProblems
    }
    
    // Get wrong questions count
    var wrongQuestionsCount: Int {
        return progress.wrongQuestionIds.count
    }
    
    // Clear wrong questions (optional)
    func clearWrongQuestions() {
        progress.wrongQuestionIds.removeAll()
        progress.wrongProblems.removeAll()
        save()
    }
    
    // Reset all progress (for testing/debugging)
    func resetProgress() {
        progress = ProgressData()
        save()
    }
}

