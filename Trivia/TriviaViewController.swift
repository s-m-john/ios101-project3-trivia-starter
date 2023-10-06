//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Sophia John on 10/6/23.
//

import UIKit

// Define the Question struct
struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var questionCounterLabel: UILabel!
    
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // Answer choices
    @IBOutlet weak var option1Label: UIButton!
    
    @IBOutlet weak var option2Label: UIButton!
    
    @IBOutlet weak var option3Label: UIButton!
    
    @IBOutlet weak var option4Label: UIButton!
    
    
    var currentQuestionIndex = 0
    var questions: [Question] = [] // Populate this array with your trivia questions
    var userScore = 0 // Variable to keep track of the user's score
    var gameIsOver = false // Variable to track if the game is over

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create and populate your trivia questions
        questions.append(Question(text: "What is the capital of France?", answers: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0))
        questions.append(Question(text: "Which planet is known as the Red Planet?", answers: ["Earth", "Mars", "Venus", "Jupiter"], correctAnswerIndex: 1))
        questions.append(Question(text: "Which gas do plants absorb from the atmosphere during photosynthesis?", answers: ["Oxygen", "Nitrogen", "Carbon Dioxide", "Hydrogen"], correctAnswerIndex: 2))

            // Add more questions as needed...

        // Do any additional setup after loading the view.
        // Display the first question when the view loads.
        displayQuestion()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if gameIsOver {
            // Game is over, don't allow further answers
            return
        }
        let selectedAnswerIndex = sender.tag
            
        // Check if the selected answer is correct.
        let currentQuestion = questions[currentQuestionIndex]
        if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
            // Handle a correct answer
            userScore += 1
            showAlert(message: "Correct!")
        } else {
            // Handle an incorrect answer
            showAlert(message: "Incorrect! The correct answer is \(currentQuestion.answers[currentQuestion.correctAnswerIndex])")
        }
            
        // Move to the next question or end the game when appropriate.
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            displayQuestion()
        } else {
            // End of the game
            gameIsOver = true
            displayFinalScore()
        }
    }

// Function to display the user's final score
    func displayFinalScore() {
        let finalScoreMessage = "You scored \(userScore) out of \(questions.count) questions correctly."
        showAlert(message: finalScoreMessage)
            
            // Add a "Restart" button or option here, and handle the game restart logic when the user taps it.
            // For example, you can reset the currentQuestionIndex, reset the userScore, and call displayQuestion() to start a new game.
    }
        
    // Function to restart the game
    //func restartGame() {
        //currentQuestionIndex = 0
        //userScore = 0
        //gameIsOver = false
        //displayQuestion()
    //}
    
    
    
    @IBAction func option1Tapped(_ sender: UIButton) {
        // Handle the tap on option 1
        checkAnswer(selectedAnswerIndex: 0)
    }

    @IBAction func option2Tapped(_ sender: UIButton) {
        // Handle the tap on option 2
        checkAnswer(selectedAnswerIndex: 1)
    }

    @IBAction func option3Tapped(_ sender: UIButton) {
        // Handle the tap on option 3
        checkAnswer(selectedAnswerIndex: 2)
    }

    @IBAction func option4Tapped(_ sender: UIButton) {
        // Handle the tap on option 4
        checkAnswer(selectedAnswerIndex: 3)
    }

    
    func checkAnswer(selectedAnswerIndex: Int) {
        let currentQuestion = questions[currentQuestionIndex]

        if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
            // Handle a correct answer (e.g., show a message or update the score)
            showAlert(message: "Correct!")
        } else {
            // Handle an incorrect answer (e.g., show a message with the correct answer)
            showAlert(message: "Incorrect! The correct answer is \(currentQuestion.answers[currentQuestion.correctAnswerIndex])")
        }

        // Move to the next question or end the game when appropriate.
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            displayQuestion()
        } else {
            // End of the game, you can display the user's score or a completion message.
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    
    //@IBAction func restartButtonTapped(_ sender: UIButton) {
        //restartGame()
    //}
    //@IBOutlet var restartButton: UIView!
    
    
    
func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.text
        option1Label.setTitle(currentQuestion.answers[0], for: .normal)
        option2Label.setTitle(currentQuestion.answers[1], for: .normal)
        option3Label.setTitle(currentQuestion.answers[2], for: .normal)
        option4Label.setTitle(currentQuestion.answers[3], for: .normal)
            
        // Update question counter if needed (e.g., "Question 1 of 10")
        let questionCounterText = "Question \(currentQuestionIndex + 1) of \(questions.count)"
            questionCounterLabel.text = questionCounterText
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
