//
//  ResultViewController.swift
//  MilionaireApp
//
//  Created by Quoc Huy on 7/3/20.
//  Copyright © 2020 Quoc Huy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var resultModel = ResultModel(totalQuestionsCount: 0, rightAnwsersCount: 0, rating: .Poor)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        
        SetUpLayout()
        SetContentToControl()
    }
    
    // MARK: Initial Control
    // Content View
    let contentView:UIView = {
        let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        //uiview.backgroundColor = .black
        return uiview
    }()
    
    // Rating Face Image
    let ratingFaceImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.image = UIImage(named: "fair-face-icon")
        image.layer.cornerRadius = 40
        return image
    }()
    
    // Score Label
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        label.text = "Score: 2/4"
        label.textColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        label.font = UIFont(name: "Verdana", size: 35)
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.layer.cornerRadius = 50
        label.textAlignment = .center
        return label
    }()
    
    // Rating Label
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Good"
        label.textColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        label.font = UIFont(name: "Snell Roundhand", size: 50.0)
        return label
    }()
    
    // Play Again Button
    let playAgainButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1), for: .normal)
        button.setTitle("Play Again", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 60
        button.addTarget(self, action: #selector(PlayAgainButtonClick), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func PlayAgainButtonClick(){
        let HomeView = HomeViewController()
        present(HomeView, animated: true, completion: nil)
    }
    // MARK : Set Up Layout
    func SetUpLayout(){
        // MARK: Add Sub view
        view.addSubview(contentView)
        [ratingFaceImage,scoreLabel,ratingLabel, playAgainButton].forEach { (item) in
            contentView.addSubview(item)
        }
        
        // MARK: Add Constrain
        // Contain view
        NSLayoutConstraint.activate([contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),contentView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        
        // Rating Face Image
        NSLayoutConstraint.activate([ratingFaceImage.topAnchor.constraint(equalTo: contentView.topAnchor),ratingFaceImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),ratingFaceImage.widthAnchor.constraint(equalToConstant: 80), ratingFaceImage.heightAnchor.constraint(equalToConstant: 80)])
        
        // Score Label
        NSLayoutConstraint.activate([scoreLabel.centerXAnchor.constraint(equalTo: ratingFaceImage.centerXAnchor),scoreLabel.topAnchor.constraint(equalTo: ratingFaceImage.bottomAnchor, constant: 30), scoreLabel.heightAnchor.constraint(equalToConstant: 100), scoreLabel.widthAnchor.constraint(equalToConstant: 200)])
        
        // Rating Label
        NSLayoutConstraint.activate([ratingLabel.centerXAnchor.constraint(equalTo: scoreLabel.centerXAnchor), ratingLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20), ratingLabel.heightAnchor.constraint(equalToConstant: 100)])
        
        // Play Again Button
        NSLayoutConstraint.activate([playAgainButton.centerXAnchor.constraint(equalTo: ratingLabel.centerXAnchor), playAgainButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20), playAgainButton.widthAnchor.constraint(equalToConstant: 120), playAgainButton.heightAnchor.constraint(equalToConstant: 120),playAgainButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)])
    }
    
    // MARK: Set content to control
    func SetContentToControl(){
        var stringImageName = ""
        var stringGrade = ""
        switch resultModel.rating {
        case .Poor:
            stringImageName = "poor-face-icon"
            stringGrade = "Poor"
        case .Fair:
            stringImageName = "fair-face-icon"
            stringGrade = "Fair"
        case .Good:
            stringImageName = "good-face-icon"
            stringGrade = "Good"
        case .VeryGood:
            stringImageName = "veryGood-face-icon"
            stringGrade = "Very Good"
        default:
            stringImageName = "excellent-face-icon"
            stringGrade = "Excellent"
        }
        ratingFaceImage.image = UIImage(named: stringImageName)
        ratingLabel.text = stringGrade
        scoreLabel.text = "Score: " + String(resultModel.rightAnwsersCount) + "/" + String(resultModel.totalQuestionsCount)
    }
}
