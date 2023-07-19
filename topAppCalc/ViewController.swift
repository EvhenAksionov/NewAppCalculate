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
    
    
    
    
    
    @IBAction func calculate() {
        
        guard let aText = aTextField.text,
              let bText = bTextField.text,
              let cText = cTextField.text,
              let a = Float(aText),
              let b = Float(bText),
              let c = Float(cText) else {return}
        
        
        
        if aText.isEmpty {
            let aTextIsEmptyAlert = UIAlertController(title: "", message: "Не вказано значення a", preferredStyle: .alert)
            aTextIsEmptyAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(aTextIsEmptyAlert, animated: true)
        } else if bText.isEmpty{
            let bTextIsEmptyAlert = UIAlertController(title: "", message: "Не вказано значення b", preferredStyle: .alert)
            bTextIsEmptyAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(bTextIsEmptyAlert, animated: true)
        } else if cText.isEmpty {
            let cTextIsEmptyAlert = UIAlertController(title: "", message: "Не вказано значення c", preferredStyle: .alert)
            cTextIsEmptyAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(cTextIsEmptyAlert, animated: true)
        }
        
        let d = pow(b,2) - (4 * a * c)
        
        enum Result {
            case noSqrt
            case oneSqrt
            case twoSqrt
        }
        
        var calculate = Result.noSqrt
        
        if d < .zero{
            calculate = Result.noSqrt
        } else if d == .zero {
            calculate = Result.oneSqrt
        } else if d > .zero{
            calculate = Result.twoSqrt
        }
        
        switch calculate{
        case.noSqrt:
            resultLabel.text = "дійсних коренів немає"
        case .oneSqrt:
            let x = -b / (2 * a)
            resultLabel.text = "x = \(x)"
        case .twoSqrt:
            let sqrtDicriminant = sqrt(d)
            let x1 = (-b + sqrtDicriminant) / (2 * a)
            let x2 = (-b - (sqrtDicriminant)) / (2 * a)
            resultLabel.text = "x1 = \(round((1000 * x1) / 1000)), x2 = \(round((1000 * x2) / 1000))"
        }
        
        
    
  
//
//        if d < .zero {
//            resultLabel.text = "дійсних коренів немає"
//        } else if d == .zero {
//            let x = -b / (2 * a)
//
//            resultLabel.text = "x = \(x)"
//        } else if d > .zero{
//            let sqrtDicriminant = sqrt(d)
//            let x1 = (-b + sqrtDicriminant) / (2 * a)
//            let x2 = (-b - (sqrtDicriminant)) / (2 * a)
//
//            resultLabel.text = "x1 = \(round((1000 * x1) / 1000)), x2 = \(round((1000 * x2) / 1000))"
//        }
    }
}

