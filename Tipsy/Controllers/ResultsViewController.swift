//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Андрей Фроленков on 15.02.23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var people = 0
    var percent = 0
    var total = "0.0"
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 people, with 10% tip."
        label.textColor = #colorLiteral(red: 0.5843137255, green: 0.6039215686, blue: 0.6, alpha: 1)
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let greenView: SecondGreenView = {
        let view = SecondGreenView(frame: .zero)
        return view
    }()
    
    var buttonRecalculate: UIButton = {
        let button = UIButton()
        button.setTitle("Recalculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(recalculatePressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        settingsLabel.text = "Split between \(people) people, with \(percent)% tip."
        greenView.totalLabel.text = total
        
        addAllSubview()
        settingConstraints()
        
    }
    
    @objc func recalculatePressed() {
        
        self.dismiss(animated: true)
    }
    
    private func addAllSubview() {
        view.addSubview(greenView)
        view.addSubview(settingsLabel)
        view.addSubview(buttonRecalculate)
    }
    
    private func settingConstraints() {
        
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: self.view.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: self.settingsLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            settingsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            buttonRecalculate.widthAnchor.constraint(equalToConstant: 200),
            buttonRecalculate.heightAnchor.constraint(equalToConstant: 54),
            buttonRecalculate.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonRecalculate.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}
