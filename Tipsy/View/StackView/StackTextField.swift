//
//  StackTextField.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class StackTextField: UIStackView {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 26)
        label.textColor = .gray
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 40)
        textField.placeholder = "e.g. 123.56"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        alignment = .center
        spacing = 26
        
        addArrangedAllSubview()
        settingConstraints()
        
    }
    
    func addArrangedAllSubview() {
        addArrangedSubview(label)
        addArrangedSubview(billTextField)
    }
    
    func settingConstraints() {
        
        NSLayoutConstraint.activate([
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
