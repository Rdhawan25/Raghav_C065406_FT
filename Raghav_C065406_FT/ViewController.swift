//
//  ViewController.swift
//  Raghav_C065406_FT
//
//  Created by Raghav Dhawan on 08/11/22.
//

import UIKit

enum Number {
    case odd
    case even
}
struct GameResult {
    var number: Int
    var selectedResult: Number
    var result: Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var randomNumber: Int = 0
    var gameResultArray : [GameResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view.
    }
    
    private func generateRandomNumber(){
        let number = Int.random(in: 1...100)
        randomNumber = number
        numberLabel.text = "\(randomNumber)"
    }

    @IBAction func evenButtonTapped(_ sender: Any) {
        if randomNumber % 2 == 0{
            showAlert(msg: "Correct answer")
            imageView.image = UIImage(named: "Right")
            let result = GameResult(number: randomNumber, selectedResult: .even, result: true)
            gameResultArray.append(result)
        } else {
            showAlert(msg: "Oops..Wrong answer..\nCorrect answer is Odd")
            imageView.image = UIImage(named: "Wrong")
            let result = GameResult(number: randomNumber, selectedResult: .even, result: false)
            gameResultArray.append(result)
        }

    }
    
    @IBAction func oddButtonTapped(_ sender: Any) {
        if randomNumber % 2 != 0{
            showAlert(msg: "Correct answer")
            imageView.image = UIImage(named: "Correct")
            let result = GameResult(number: randomNumber, selectedResult: .odd, result: true)
            gameResultArray.append(result)

        } else {
            showAlert(msg: "Oops..Wrong answer..\nCorrect answer is Even")
            imageView.image = UIImage(named: "InCorrect")
            let result = GameResult(number: randomNumber, selectedResult: .odd, result: false)
            gameResultArray.append(result)

        }
    }
    
    private func showAlert(msg: String) {
        
        let alert = UIAlertController(title: "Result", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again!", style: .default, handler: { _ in
            self.generateRandomNumber()
        }))
        alert.addAction(UIAlertAction(title: "Show Progress", style: .default, handler: { _ in
//            self.generateRandomNumber() show Progress
            self.performSegue(withIdentifier: "progressSegue", sender: nil)
            
        }))
        self.present(alert, animated: false)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "progressSegue"{
            let destinationVC = segue.destination as! ProgressViewController
            destinationVC.resultArray = gameResultArray
        }
    }
}

