//
//  GreenView.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class GreenView: UIView {
    
    let mainStackView: MainStackView = {
        let stack = MainStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttonCalculate: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(CalculatorViewController.calculatePressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        
        addAllSubview()
        settingConstraints()
        
    }
    
    private func addAllSubview() {
        addSubview(mainStackView)
        addSubview(buttonCalculate)
    }
    
    private func settingConstraints() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            buttonCalculate.widthAnchor.constraint(equalToConstant: 200),
            buttonCalculate.heightAnchor.constraint(equalToConstant: 54),
            buttonCalculate.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonCalculate.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func getSplitNumberlabel() -> Int {
       return mainStackView.getSplitNumberlabel()
    }
    
    func buttonIsSelected(zeroPctButton: Bool, tenPctButton: Bool, twentyPctButton: Bool) {
        
        mainStackView.buttonIsSelected(zeroPctButton: zeroPctButton, tenPctButton: tenPctButton, twentyPctButton: twentyPctButton)
    }
    
    func updateStepperCount(value: Double) {
        
        mainStackView.updateStepperCount(value: value)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
