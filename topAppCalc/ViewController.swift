//
//  ViewController.swift
//  topAppCalc
//
//  Created by Женя Аксьонов on 29.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet private weak var aTextField: UITextField!
    @IBOutlet private weak var bTextField: UITextField!
    @IBOutlet private weak var cTextField: UITextField!
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    
    @IBOutlet var tebleView: UITableView!
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    @IBAction func calculate() {
        
        guard let aText = aTextField.text, !aText.isEmpty else {
            showAlert(with: "a is empty")
            return
        }
        guard let bText = bTextField.text, !bText.isEmpty else {
            showAlert(with: "b is empty")
            return
        }
        guard let cText = cTextField.text, !cText.isEmpty else {
            showAlert(with: "c is empty")
            return
        }
        
        //TODO: - add validation alerts
#warning("add validation alerts")
        guard let a = Float(aText),
              let b = Float(bText),
              let c = Float(cText) else { return }
        
        guard a != .zero else {
            showAlert(with: "a can`t = 0")
            return
        }
        
        let d = pow(b,2) - (4 * a * c)
        var currentResult: Result = .noRoots
        
        if d < .zero {
            resultLabel.text = "дійсних коренів немає"
            currentResult = .noRoots
        } else if d == .zero {
            let x = -b / (2 * a)
            resultLabel.text = "x = \(x)"
            currentResult = .oneRoot(result: x)
        } else if d > .zero {
            let sqrtDicriminant = sqrt(d)
            let x1 = (-b + sqrtDicriminant) / (2 * a)
            let x2 = (-b - (sqrtDicriminant)) / (2 * a)
            resultLabel.text = "x1 = \(round((1000 * x1) / 1000)), x2 = \(round((1000 * x2) / 1000))"
            currentResult = .twoRoots(result1: x1, result2: x2)
        }
        
        
        
        
        
        //        let userDefaults = UserDefaults.standard
        
        
        
    }
    
    
    
    
    
    
    
    
    
