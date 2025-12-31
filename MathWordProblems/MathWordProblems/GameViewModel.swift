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
    
    private var autoAdvanceWorkItem: DispatchWorkItem?

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

        // Cancel any pending auto-advance
        autoAdvanceWorkItem?.cancel()
        autoAdvanceWorkItem = nil
        
        let shuffled = allProblems.shuffled()
        sessionProblems = Array(shuffled.prefix(sessionSize))
        currentIndex = 0
        correctCount = 0
        totalAttempts = 0
        showFeedback = false
        selectedAnswerIndex = nil
        isCorrectAnswer = false
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
            print("✅ Correct answer selected - will auto-advance after 2 seconds")
            
            // Cancel any existing auto-advance
            autoAdvanceWorkItem?.cancel()
            
            // Show feedback first
            showFeedback = true
            
            // Record progress
            ProgressTracker.shared.recordAttempt(difficulty: difficulty, isCorrect: isCorrectAnswer)
            
            // Auto-advance to next question after 2 seconds for correct answers
            let workItem = DispatchWorkItem { [weak self] in
                guard let self = self else { return }
                // Double-check conditions before advancing
                if self.showFeedback && self.isCorrectAnswer && !self.sessionFinished {
                    print("➡️ Auto-advancing to next question (correct answer)")
                    self.goToNextProblem()
                } else {
                    print("⚠️ Skipping auto-advance: showFeedback=\(self.showFeedback), isCorrect=\(self.isCorrectAnswer), finished=\(self.sessionFinished)")
                }
            }
            autoAdvanceWorkItem = workItem
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: workItem)
        } else {
            // WRONG ANSWER - Show explanation and wait for user input
            // Cancel any existing auto-advance (shouldn't be any, but be safe)
            autoAdvanceWorkItem?.cancel()
            autoAdvanceWorkItem = nil
            
            // Show correct answer and explanation when wrong
            let correctAnswer = problem.answers[correctIndex]
            explanationText = "❌ Incorrect.\n\nThe correct answer is \(correctAnswer).\n\n\(problem.explanation)"
            
            // Track wrong question - ensure it's saved with full problem data
            ProgressTracker.shared.recordWrongQuestion(problemId: problem.id, problem: problem)
            print("📝 Tracked wrong question: \(problem.id)")
            print("⚠️ Wrong answer selected - showing explanation")
            print("📝 Explanation text: \(explanationText)")
            
            // Show feedback FIRST - DO NOT auto-advance for wrong answers
            showFeedback = true
            
            // Record progress
            ProgressTracker.shared.recordAttempt(difficulty: difficulty, isCorrect: isCorrectAnswer)
            
            print("📊 Feedback shown for wrong answer. showFeedback=\(showFeedback), isCorrectAnswer=\(isCorrectAnswer)")
            print("📊 User MUST click Next button to proceed - NO auto-advance")
        }
    }

    func goToNextProblem() {
        guard !sessionProblems.isEmpty, showFeedback else { 
            print("⚠️ Cannot go to next: showFeedback=\(showFeedback)")
            return 
        }
        
        // IMPORTANT: For wrong answers, this should ONLY be called by user clicking Next button
        // If isCorrectAnswer is false, this means it's a wrong answer and should NOT auto-advance
        if !isCorrectAnswer {
            print("✅ User clicked Next button for wrong answer - proceeding to next question")
        }
        
        // Cancel any pending auto-advance
        autoAdvanceWorkItem?.cancel()
        autoAdvanceWorkItem = nil
        
        print("➡️ Moving to next problem")

        selectedAnswerIndex = nil  // Reset selection
        
        if currentIndex + 1 < sessionProblems.count {
            currentIndex += 1
            currentProblem = sessionProblems[currentIndex]
            showFeedback = false
            isCorrectAnswer = false  // Reset
            print("✅ Moved to problem \(currentIndex + 1) of \(sessionProblems.count)")
        } else {
            currentProblem = nil
            sessionFinished = true
            showFeedback = false
            print("✅ Session finished")
        }
    }
    
    func goToPreviousProblem() {
        guard !sessionProblems.isEmpty else { return }
        
        // Cancel any pending auto-advance
        autoAdvanceWorkItem?.cancel()
        autoAdvanceWorkItem = nil
        
        selectedAnswerIndex = nil  // Reset selection
        
        if currentIndex > 0 {
            currentIndex -= 1
            currentProblem = sessionProblems[currentIndex]
            showFeedback = false
            isCorrectAnswer = false  // Reset
        }
    }
    
    var hasPreviousProblem: Bool {
        return currentIndex > 0
    }
    
    var hasNextProblem: Bool {
        return currentIndex + 1 < sessionProblems.count
    }
}
