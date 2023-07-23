//
//  ViewController.swift
//  topAppCalc
//
//  Created by Женя Аксьонов on 29.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var aTextField: UITextField!
    @IBOutlet private weak var bTextField: UITextField!
    @IBOutlet private weak var cTextField: UITextField!
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: func validation
    func textFieldIsEmpty (message: String) {
        let TextFieldIsEmptyAlert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        TextFieldIsEmptyAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(TextFieldIsEmptyAlert, animated: true)
    }
    
    
    @IBAction func calculate() {
        
        guard let aText = aTextField.text,
              let bText = bTextField.text,
              let cText = cTextField.text
              else {return}

        guard !aText.isEmpty else {
            textFieldIsEmpty(message: "a is empty")
            return}
        guard !bText.isEmpty else {
            textFieldIsEmpty(message: "b is empty")
            return}
        guard !cText.isEmpty else {
            textFieldIsEmpty(message: "c is empty")
            return}
        
        guard let a = Float(aText),
              let b = Float(bText),
              let c = Float(cText)
                else {return}
        
        guard a != .zero else {
            textFieldIsEmpty(message: "a can`t = 0")
            return
        }
        
            let d = pow(b,2) - (4 * a * c)
            
        enum Result {
                case noRoots
                case oneRoot
                case twoRoots
            }
        
        var calculate1 = Result.noRoots
        
        
        
        switch calculate1{
        case .noRoots:
            resultLabel.text = "дійсних коренів немає"
        case .oneRoot:
            let x = -b / (2 * a)
            resultLabel.text = "x = \(x)"
        case .twoRoots:
            let sqrtDicriminant = sqrt(d)
            let x1 = (-b + sqrtDicriminant) / (2 * a)
            let x2 = (-b - (sqrtDicriminant)) / (2 * a)
            resultLabel.text = "x1 = \(round((1000 * x1) / 1000)), x2 = \(round((1000 * x2) / 1000))"
        }
        
        guard d >= .zero else {
            calculate1 = Result.noRoots
            return
        }
        guard d > 0 || d < 0 else {
            calculate1 = Result.oneRoot
            return
        }
        guard d <= 0 else {
            calculate1 = Result.twoRoots
            return
        }
    }
}
        

        
  

    


