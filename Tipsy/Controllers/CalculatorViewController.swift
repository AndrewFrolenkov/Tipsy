//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let stackTextField: StackTextField = {
        let stack = StackTextField()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let greenView: GreenView = {
        let greenView = GreenView(frame: .zero)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        return greenView
    }()
    
    var percentButton = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        settingConstraints()
        
    }
    
    @objc func stepperValueChanged(sender: UIStepper) {
        
        greenView.updateStepperCount(value: sender.value)
        
    }
    
    @objc func calculatePressed(sender: UIButton) {
        
        guard let text = stackTextField.billTextField.text, let check = Double(text)  else { return }
        let percent = percentButton
        let splitNumberLabel = greenView.getSplitNumberlabel()
        
        let totalSum = (check * (1 + percent) / Double(splitNumberLabel))
        let resultTo2DecimalPlaces = String(format: "%.2f", totalSum)
        finalResult = resultTo2DecimalPlaces
        
        
        let resultsVC = ResultsViewController()
        resultsVC.modalPresentationStyle = .fullScreen
        resultsVC.percent = Int(percentButton * 100)
        resultsVC.people = greenView.getSplitNumberlabel()
        resultsVC.total = finalResult
        
        self.present(resultsVC, animated: true)
    }
    
    @objc func tipChanged(sender: UIButton) {
        
        
        switch sender.titleLabel?.text {
            
        case "0%": greenView.buttonIsSelected(zeroPctButton: true, tenPctButton: false, twentyPctButton: false)
            self.percentButton = percentOfNumber(value: 0)
        case "10%": greenView.buttonIsSelected(zeroPctButton: false, tenPctButton: true, twentyPctButton: false)
            self.percentButton = percentOfNumber(value: 10)
        case "20%": greenView.buttonIsSelected(zeroPctButton: false, tenPctButton: false, twentyPctButton: true)
            self.percentButton = percentOfNumber(value: 20)
        default:
            print("Error")
        }
        
        stackTextField.billTextField.endEditing(true)
    }
    
    private func percentOfNumber(value: Int) -> Double {
        
        let value = Double(value) / 100
        return value
    }
    
    func addAllSubview() {
        
        self.view.addSubview(stackTextField)
        self.view.addSubview(greenView)
    }
    
    func settingConstraints() {
        
        NSLayoutConstraint.activate([
            stackTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 40),
            greenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
    
    
}

