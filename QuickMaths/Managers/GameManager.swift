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
    
    var numberFreq = 2.0
    var numberRange = 10.0
    
    @Published var dataObject = GameDataObject()
    
    @Published var questionManager = GameQuestionManager()
    
    @Published var timerManager = TimerManager()
    
    
    @Published var gameStarted = false
    @Published var gameStatus: GameStatus = .config
    
    @Published var saveGame = true
//    @Published var roundComplete = false
    
    
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



// TODO: convert this into init
extension GameManager {
    static func createGameManager(_ gameType: GameType, _ gameConfig: GameConfigObject) -> GameManager {
        let gameManager = GameManager(gameType: gameType)
        gameManager.numberFreq = gameConfig.gameNumberFreq
        gameManager.numberRange = gameConfig.gameNumberRange
        
        gameManager.timerManager.timerDuration = TimerManager.lengthToSeconds(gameConfig.timerLength)
        gameManager.timerManager.secondsRemaining = gameManager.timerManager.timerDuration
        
        gameManager.gameStarted = true
        
        gameManager.getNewQuestion()
        
        gameManager.startTimer()
        
        return gameManager
    }
}



extension GameManager {
    func recordTimePassed() {
        dataObject.roundDuration += 1
        dataObject.roundQuestionDuration[dataObject.roundDuration] = dataObject.questionNumber
    }
}


extension GameManager {
    func submitAnswer() {
//        checkAndSetAnswerToggle()
        let ans = checkAnswer(answer: questionManager.answer ?? 0)
        if ans == true {
            questionManager.result = .correct
            dataObject.correctAnswers += 1
            addTry()
            getNewQuestion()
            dataObject.questionAttempts = 0
        } else if ans == false {
            questionManager.result = .incorrect
            dataObject.incorrectAnswers += 1
            addTry()
        }
    }
    
    func checkAnswer(answer: Int) -> Bool {
        if answer == questionManager.realAnswer {
            return true
        } else if answer != questionManager.realAnswer {
            return false
        }
        return false
    }
    
    
    func addTry() {
        // Use the number of questions answered correctly to check last bit of dictionary
        dataObject.roundQuestionAttempts[dataObject.questionNumber] = dataObject.questionAttempts
    }
    
    func getNewQuestion() {
        resetQuestionFields()
        let result = quickMathsManager.simpleAddition(numbers: Int(numberFreq), range: Int(numberRange))
        questionManager.question = "\(result.question) ??"
        questionManager.realAnswer = result.answer
        dataObject.questionNumber += 1
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
        print("Tick")
        self.timerManager.secondsRemaining -= 1
        self.recordTimePassed()
        if self.timerManager.secondsRemaining == 0 {
            self.stopTimer()
            self.gameStarted = false
        }
    }
    
    func stopTimer() {
        timerManager.timer?.invalidate()
    }
    
}
