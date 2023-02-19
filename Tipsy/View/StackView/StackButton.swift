//
//  stackForTopView.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class StackButton: UIStackView {
    
    lazy var zeroPctButton: UIButton = {
        return settingButton(text: "0%", fontSize: 35)
    }()
    
    lazy var tenPctButton: UIButton = {
        return settingButton(text: "10%", fontSize: 35)
    }()
    
    lazy var twentyPctButton: UIButton = {
        return settingButton(text: "20%", fontSize: 35)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .fillProportionally
        alignment = .fill
        spacing = 0
        
        addArrangedAllSubview()
    }
    
    func addArrangedAllSubview() {
        
        addArrangedSubview(zeroPctButton)
        addArrangedSubview(tenPctButton)
        addArrangedSubview(twentyPctButton)
    }
//zeroPctButton: Bool, tenPctButton: Bool, twentyPctButton: Bool
    
    func buttonIsSelected(zeroPctButton: Bool, tenPctButton: Bool, twentyPctButton: Bool) {
        
        self.zeroPctButton.isSelected = zeroPctButton
        self.tenPctButton.isSelected = tenPctButton
        self.twentyPctButton.isSelected = twentyPctButton
    }
    
    private func settingButton(text: String, fontSize: CGFloat) -> UIButton {
        
        let button = UIButton()
        button.configuration = buttonConfiguration(text: text, fontSize: fontSize)
        button.addTarget(nil, action: #selector(CalculatorViewController.tipChanged), for: .touchUpInside)
        
        return button
    }
    
    private func buttonConfiguration(text: String, fontSize: CGFloat) -> UIButton.Configuration {
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = text
        configuration.attributedTitle?.font = .systemFont(ofSize: fontSize)
        configuration.attributedTitle?.foregroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        configuration.baseBackgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        
        return configuration
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
