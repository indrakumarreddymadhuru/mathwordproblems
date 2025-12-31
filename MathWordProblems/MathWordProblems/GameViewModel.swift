import Foundation
import Combine

final class GameViewModel: ObservableObject {
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
    @Published var selectedAnswerIndex: Int? = nil

    let sessionSize: Int = 10  // how many problems per play session

    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        loadProblems()
        startNewSession()
    }

    func loadProblems() {
        allProblems = JSONLoader.loadProblems(for: difficulty)
    }

    func startNewSession() {
        guard !allProblems.isEmpty else {
            currentProblem = nil
            sessionFinished = true
            return
        }

        let shuffled = allProblems.shuffled()
        sessionProblems = Array(shuffled.prefix(sessionSize))
        currentIndex = 0
        correctCount = 0
        totalAttempts = 0
        showFeedback = false
        selectedAnswerIndex = nil
        sessionFinished = false
        currentProblem = sessionProblems.first
    }

    func selectAnswer(at index: Int) {
        // Prevent double-tapping and ensure we have a problem
        guard let problem = currentProblem, !showFeedback else { 
            print("⚠️ Cannot select answer: showFeedback=\(showFeedback), problem=\(currentProblem != nil)")
            return 
        }

        print("✅ Answer selected: index=\(index), correctIndex=\(problem.correct)")
        
        selectedAnswerIndex = index
        totalAttempts += 1
        let correctIndex = problem.correct
        isCorrectAnswer = (index == correctIndex)
        
        // Always show explanation, especially for wrong answers
        if isCorrectAnswer {
            explanationText = "✅ Correct!\n\n\(problem.explanation)"
            correctCount += 1
            print("✅ Correct answer selected")
        } else {
            // Show correct answer and explanation when wrong
            let correctAnswer = problem.answers[correctIndex]
            explanationText = "❌ Incorrect.\n\nThe correct answer is \(correctAnswer).\n\n\(problem.explanation)"
            
            // Track wrong question - ensure it's saved with full problem data
            ProgressTracker.shared.recordWrongQuestion(problemId: problem.id, problem: problem)
            print("📝 Tracked wrong question: \(problem.id)")
            print("⚠️ Wrong answer - showing explanation, NOT auto-advancing")
        }
        
        // Show feedback AFTER setting explanation
        // DO NOT auto-advance - user must click Next/Previous
        showFeedback = true
        
        // Record progress
        ProgressTracker.shared.recordAttempt(difficulty: difficulty, isCorrect: isCorrectAnswer)
        
        print("📊 Feedback shown. showFeedback=\(showFeedback), waiting for user to click Next")
    }

    func goToNextProblem() {
        guard !sessionProblems.isEmpty, showFeedback else { 
            print("⚠️ Cannot go to next: showFeedback=\(showFeedback)")
            return 
        }
        
        print("➡️ Moving to next problem")

        selectedAnswerIndex = nil  // Reset selection
        
        if currentIndex + 1 < sessionProblems.count {
            currentIndex += 1
            currentProblem = sessionProblems[currentIndex]
            showFeedback = false
            print("✅ Moved to problem \(currentIndex + 1) of \(sessionProblems.count)")
        } else {
            currentProblem = nil
            sessionFinished = true
            print("✅ Session finished")
        }
    }
    
    func goToPreviousProblem() {
        guard !sessionProblems.isEmpty else { return }
        
        selectedAnswerIndex = nil  // Reset selection
        
        if currentIndex > 0 {
            currentIndex -= 1
            currentProblem = sessionProblems[currentIndex]
            showFeedback = false
        }
    }
    
    var hasPreviousProblem: Bool {
        return currentIndex > 0
    }
    
    var hasNextProblem: Bool {
        return currentIndex + 1 < sessionProblems.count
    }
}
