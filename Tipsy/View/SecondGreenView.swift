//
//  SecondGreenView.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class SecondGreenView: UIView {
    
    let perPerson: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.textColor = #colorLiteral(red: 0.5843137255, green: 0.6039215686, blue: 0.6, alpha: 1)
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "56.32"
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        
        addAllSubview()
        settingConstraints()
        
    }
    
    func addAllSubview() {
        addSubview(perPerson)
        addSubview(totalLabel)
    }
    
    private func settingConstraints() {
        
        NSLayoutConstraint.activate([
            perPerson.centerYAnchor.constraint(equalTo: centerYAnchor),
            perPerson.leadingAnchor.constraint(equalTo: leadingAnchor),
            perPerson.trailingAnchor.constraint(equalTo: trailingAnchor),
            perPerson.bottomAnchor.constraint(equalTo: totalLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 100)

        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
