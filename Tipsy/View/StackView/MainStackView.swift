//
//  MainStackView.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class MainStackView: UIStackView {
    
    let selectTip: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.textColor = .gray
        return label
    }()
    
    let chooseSplit: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 27)
        label.textColor = .gray
        return label
    }()
    
    let stackButton: StackButton = {
        let stack = StackButton()
        return stack
    }()
    
    let stackStepper: StackStepper = {
        let stack = StackStepper()
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        distribution = .fillEqually
        spacing = 27
        
        addArrangedAllSubview()
    }
    
    func addArrangedAllSubview() {
        
        addArrangedSubview(selectTip)
        addArrangedSubview(stackButton)
        addArrangedSubview(chooseSplit)
        addArrangedSubview(stackStepper)
        
    }
    
    func getSplitNumberlabel() -> Int {
        return stackStepper.getSplitNumberlabel()
    }
    
    func buttonIsSelected(zeroPctButton: Bool, tenPctButton: Bool, twentyPctButton: Bool) {
        
        stackButton.buttonIsSelected(zeroPctButton: zeroPctButton, tenPctButton: tenPctButton, twentyPctButton: twentyPctButton)
    }
    
    func updateStepperCount (value: Double) {
        
        stackStepper.updateStepperCount(value: value)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
