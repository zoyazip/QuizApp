

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressionBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choiceOne: UIButton!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressionBar.progress = 0.0
        updateUi()
        
    }

    @IBAction func resetButton(_ sender: Any) {
        quizBrain.reset()
        updateUi()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
    }
    
    
    
    @objc func updateUi(){
        scoreLable.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        choiceOne.backgroundColor = UIColor.clear
        progressionBar.progress = quizBrain.getProgress()
        
        let answerChoices = quizBrain.getAnswers()
        choiceOne.setTitle(answerChoices[0], for: .normal)
        trueButton.setTitle(answerChoices[1], for: .normal)
        falseButton.setTitle(answerChoices[2], for: .normal)
    }
    
}

