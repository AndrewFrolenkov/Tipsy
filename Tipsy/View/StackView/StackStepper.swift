//
//  StackStepper.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class StackStepper: UIStackView {

    let splitNumberlabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35)
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.stepValue = 1
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.value = 2
        stepper.addTarget(nil, action: #selector(CalculatorViewController.stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .fillEqually
        spacing = 50
        alignment = .center
        
        addArrangedAllSubview()
    }
    
    func getSplitNumberlabel() -> Int {
        
        return Int(stepper.value)
    }
    
    func updateStepperCount (value: Double) {
        
        splitNumberlabel.text = Int(value).description
    }
    
    private func addArrangedAllSubview() {
        
        addArrangedSubview(splitNumberlabel)
        addArrangedSubview(stepper)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
