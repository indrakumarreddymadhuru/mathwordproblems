import Foundation

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
        sessionFinished = false
        currentProblem = sessionProblems.first
    }

    func selectAnswer(at index: Int) {
        guard let problem = currentProblem else { return }

        totalAttempts += 1
        let correctIndex = problem.correct
        isCorrectAnswer = (index == correctIndex)
        showFeedback = true
        explanationText = problem.explanation

        if isCorrectAnswer {
            correctCount += 1
        }
        
        // Record progress
        ProgressTracker.shared.recordAttempt(difficulty: difficulty, isCorrect: isCorrectAnswer)
    }

    func goToNextProblem() {
        guard !sessionProblems.isEmpty else { return }

        if currentIndex + 1 < sessionProblems.count {
            currentIndex += 1
            currentProblem = sessionProblems[currentIndex]
            showFeedback = false
        } else {
            currentProblem = nil
            sessionFinished = true
        }
    }
    
    func goToPreviousProblem() {
        guard !sessionProblems.isEmpty else { return }
        
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

