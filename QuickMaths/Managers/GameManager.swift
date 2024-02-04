//
//  GameManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

class GameManager: ObservableObject {
    
    internal init(gameType: GameType, gameNumberFreq: Double = 2.0, gameNumberRange: Double = 10.0) {
        self.gameType = gameType
        self.numberFreq = gameNumberFreq
        self.numberRange = gameNumberRange
    }
    
    let quickMathsManager = QuickMathsManager()
    
    let gameType: GameType
    
    @Published var numberFreq = 2.0
    @Published var numberRange = 10.0
    
    @Published var dataObject = GameDataObject()
    
    @Published var questionManager = GameQuestionManager()
    
    @Published var timerManager = TimerManager()
    
    @Published var gameStatus: GameStatus = .config
    
    @Published var saveGame = true
    
    var gameLog: GameLog?
    
}

enum GameStatus: Identifiable {
    case config
    case active
    case results
    case stop
    var id: Self {self}
}

extension GameManager {
    static let example = GameManager(
        gameType: .addition
    )
}

extension GameManager {
    func configureGame() {
        timerManager.totalDuration = timerManager.timerLength.rawValue
        timerManager.secondsRemaining = timerManager.totalDuration
        getNewQuestion()
        gameStatus = .active
        startTimer()
    }
}

extension GameManager {
    func submitAnswer() {
        let ans = checkAnswer(answer: questionManager.answer ?? 0)
        if ans == true {
            questionManager.result = .correct
            dataObject.gameQuestionDurations[dataObject.questionNumber] = timerManager.questionDuration
            timerManager.questionDuration = 0
            dataObject.correctAnswers += 1
            addTry()
            dataObject.questionAttempts = 0
            getNewQuestion()
        } else if ans == false {
            questionManager.result = .incorrect
            dataObject.incorrectAnswers += 1
            addTry()
            resetQuestionFields()
        }
    }
    
    func checkAnswer(answer: Double) -> Bool {
        if answer == questionManager.realAnswer {
            return true
        } else if answer != questionManager.realAnswer {
            return false
        }
        return false
    }
    
    
    func addTry() {
        dataObject.gameQuestionAttempts[dataObject.questionNumber] = dataObject.questionAttempts
    }
    
    
    func getNewQuestion() {
        resetQuestionFields()
        let result = quickMathsManager.getResult(gameType, Int(numberFreq), Int(numberRange))
        if gameType == .whichSign {
            questionManager.question = result.question
        } else {
            questionManager.question = "\(result.question) = ??"
        }
        questionManager.realAnswer = result.answer
        print(result.answer)
        dataObject.questionNumber += 1
        dataObject.gameQuestions[dataObject.questionNumber] = result.question
        dataObject.gameAnswers[dataObject.questionNumber] = result.answer
    }
    
}


extension GameManager {
    func resetQuestionFields() {
        questionManager.inputText = " "
        questionManager.answer = nil
    }
}


// MARK: - Timer Functionality
extension GameManager {
    func startTimer() {
        timerManager.timer?.invalidate()
        timerManager.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        self.timerManager.secondsRemaining -= 1
        timerManager.questionDuration += 1
        if self.timerManager.secondsRemaining == 0 {
            dataObject.gameQuestionDurations[dataObject.questionNumber] = timerManager.questionDuration
            self.stopTimer()
            self.gameStatus = .results
            createGameLog()
        }
    }
    
    func stopTimer() {
        timerManager.timer?.invalidate()
    }
    
}


extension GameManager {
    
    func restartGame() {
        gameLog = nil
        dataObject = GameDataObject()
        questionManager = GameQuestionManager()
        let previousTimerLength = timerManager.timerLength
        timerManager = TimerManager()
        timerManager.timerLength = previousTimerLength
        gameStatus = .config
    }
    
    func stopGame() {
        gameStatus = .stop
    }
    
}

extension GameManager {
    func createGameLog() {
        let modifier = CoreDataModifier(CoreDataManager.shared.container.viewContext)
        
        let gameLog = modifier.createGameLog(
            date: timerManager.dateStarted,
            duration: timerManager.totalDuration,
            gameType: gameType,
            numberFreq: numberFreq,
            numberRange: numberRange,
            questionsAsked: dataObject.questionNumber,
            correctAnswers: dataObject.correctAnswers,
            incorrectAnswers: dataObject.incorrectAnswers,
            gameQuestionAttempts: dataObject.gameQuestionAttempts,
            gameQuestionDurations: dataObject.gameQuestionDurations,
            gameQuestions: dataObject.gameQuestions,
            gameAnswers: dataObject.gameAnswers
        )
        
        self.gameLog = gameLog
    }
}
