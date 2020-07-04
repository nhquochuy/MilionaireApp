//
//  HomeViewController.swift
//  MilionaireApp
//
//  Created by Quoc Huy on 6/29/20.
//  Copyright © 2020 Quoc Huy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Initial Control
    let startButton : UIButton={
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        button.setTitle("START", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.953854382, blue: 0.8467800021, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 30)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 70
        button.addTarget(self, action: #selector(StartButtonClick), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func StartButtonClick(){
        let QuizView = QuizViewController()
        
        UIView.animate(withDuration: 1, animations: {
            self.startButton.transform = .init(scaleX: 10, y: 10)
            self.startButton.alpha = 0
        }) { (animate) in
            self.present(QuizView, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.953854382, blue: 0.8467800021, alpha: 1)
        
        // MARK: Add Subview and Constrains
        self.view.addSubview(startButton)
        
        NSLayoutConstraint.activate([startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), startButton.widthAnchor.constraint(equalToConstant: 140), startButton.heightAnchor.constraint(equalToConstant: 140)])
    }
}
