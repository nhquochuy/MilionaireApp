//
//  QuizViewController.swift
//  MilionaireApp
//
//  Created by Quoc Huy on 6/29/20.
//  Copyright © 2020 Quoc Huy. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    let jsonString =
    """
[
      {
        "content" : "1 + 1 = ?",
         "result" : "A",
         "answers": [
                      {
                        "code": "A",
                        "content": "2"
                      },
                      {
                        "code": "B",
                        "content": "3"
                      },
                      {
                        "code": "C",
                        "content": "4"
                      },
                      {
                        "code": "D",
                        "content": "5"
                      }
                    ]
      },
        {
            "content": "What is VietNam's capital city?",
            "result": "B",
            "answers": [
            {
            "code": "A",
            "content": "Ho Chi Minh"
            },
            {
            "code": "B",
            "content": "Ha Noi"
            },
            {
            "code": "C",
            "content": "Da Nang"
            },
            {
            "code": "D",
            "content": "Hue"
            }
            ]
    },
      {
        "content": "3 + 3 = ?",
        "result": "C",
        "answers": [
        {
        "code": "A",
        "content": "9"
        },
        {
        "code": "B",
        "content": "12"
        },
        {
        "code": "C",
        "content": "6"
        },
        {
        "code": "D",
        "content": "15"
        }
        ]
      },
      {
        "content": "How many seasons in a year?",
         "result": "D",
         "answers": [
                      {
                        "code": "A",
                        "content": "3 seasons"
                      },
                      {
                        "code": "B",
                        "content": "5 seasons"
                      },
                      {
                        "code": "C",
                        "content": "9 seasons"
                      },
                      {
                        "code": "D",
                        "content": "4 seasons"
                      }
                    ]
      }
    ]
"""
    // MARK: Initial Control
    // Content View
    let contentView:UIView = {
        let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        //uiview.backgroundColor = .black
        return uiview
    }()
    
    // Question Label
    let questionLabel:UILabel={
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        label.textColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        label.layer.cornerRadius = 35
        
        return label
    }()
    
    // Answer Button A
    let answerAButton: UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1), for: .normal)
        button.tag = 1
        button.contentEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(answerButtonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Answer Button B
    let answerBButton: UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1), for: .normal)
        button.tag = 2
        button.contentEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(answerButtonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Answer Button C
    let answerCButton: UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1), for: .normal)
        button.tag = 3
        button.contentEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(answerButtonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Answer Button D
    let answerDButton: UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1), for: .normal)
        button.tag = 4
        button.contentEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(answerButtonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Result Image
    let resultImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 35
        return image
    }()
    
    var rightAnwserCount = 0
    @objc fileprivate func answerButtonClick(sender : UIButton)
      {
        //print(sender.tag)
        var answer:String?
        switch sender.tag {
        case 1:
            answer = "A"
        case 2:
            answer = "B"
        case 3:
            answer = "C"
        default:
            answer = "D"
        }
        
        if answer == currentQuestionModel?.result
        {
            resultImage.image = UIImage(named: "right-answer-icon")
            rightAnwserCount += 1
        }
        else
        {
            resultImage.image = UIImage(named: "wrong-answer-icon")
        }
        
        SetDataForObjectControl()
      }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        
        SetUpLayout()
        HandleJsonDataToQuestionModel()
        SetDataForObjectControl()
    }
    
    // MARK: Setup Auto Layout
    func SetUpLayout()
    {
        // MARK: Add SubView
        view.addSubview(contentView)
        [questionLabel,answerAButton,answerBButton,answerCButton,answerDButton, resultImage].forEach { (item) in
            contentView.addSubview(item)
        }
        
        contentView.addSubview(resultImage)
        
        // MARK: Add Constrains
        // Content View
        NSLayoutConstraint.activate([contentView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor), contentView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)])
        contentView.layer.cornerRadius = contentView.frame.height/2
        
        // Question Label
        NSLayoutConstraint.activate([questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20), questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20), questionLabel.heightAnchor.constraint(equalToConstant: 70)])
        
        // Answer button A
        NSLayoutConstraint.activate([answerAButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50), answerAButton.centerXAnchor.constraint(equalTo: questionLabel.centerXAnchor),answerAButton.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor, constant: 25), answerAButton.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor, constant: -25), answerAButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Answer button B
        NSLayoutConstraint.activate([answerBButton.topAnchor.constraint(equalTo: answerAButton.bottomAnchor, constant: 5), answerBButton.centerXAnchor.constraint(equalTo: answerAButton.centerXAnchor),answerBButton.leadingAnchor.constraint(equalTo: answerAButton.leadingAnchor), answerBButton.trailingAnchor.constraint(equalTo: answerAButton.trailingAnchor), answerBButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Answer button C
        NSLayoutConstraint.activate([answerCButton.topAnchor.constraint(equalTo: answerBButton.bottomAnchor, constant: 5), answerCButton.centerXAnchor.constraint(equalTo: answerBButton.centerXAnchor),answerCButton.leadingAnchor.constraint(equalTo: answerBButton.leadingAnchor), answerCButton.trailingAnchor.constraint(equalTo: answerBButton.trailingAnchor), answerCButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Answer button D
        NSLayoutConstraint.activate([answerDButton.topAnchor.constraint(equalTo: answerCButton.bottomAnchor, constant: 5), answerDButton.centerXAnchor.constraint(equalTo: answerCButton.centerXAnchor),answerDButton.leadingAnchor.constraint(equalTo: answerCButton.leadingAnchor), answerDButton.trailingAnchor.constraint(equalTo: answerCButton.trailingAnchor), answerDButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Result Image
        NSLayoutConstraint.activate([resultImage.centerXAnchor.constraint(equalTo: answerDButton.centerXAnchor), resultImage.topAnchor.constraint(equalTo: answerDButton.bottomAnchor, constant: 20), resultImage.widthAnchor.constraint(equalToConstant: 70), resultImage.heightAnchor.constraint(equalToConstant: 70),
                                     resultImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }
    
    
    var questionModels:[QuestionModel] = []
    var currentQuestionModel:QuestionModel?
    var totalQuestion = 0
    // MARK: Handel Json Data
    func HandleJsonDataToQuestionModel() {
        do{
            guard let jsonData = jsonString.data(using: .utf8) else {return}
            questionModels = try JSONDecoder().decode([QuestionModel].self, from: jsonData)
            totalQuestion = questionModels.count
        }
        catch let jsonErr
        { print("Can not decode JsonString", jsonErr)}
    }
    
    // MARK: Set Data For Object Control
    func SetDataForObjectControl()
    {
        currentQuestionModel = questionModels.randomElement()
        if let question = currentQuestionModel
        {
            questionLabel.text = question.content
            answerAButton.setTitle("A. " + question.answers[0].content, for: .normal)
            answerBButton.setTitle("B. " + question.answers[1].content, for: .normal)
            answerCButton.setTitle("C. " + question.answers[2].content, for: .normal)
            answerDButton.setTitle("D. " + question.answers[3].content, for: .normal)
            
            questionModels = questionModels.filter { (questionModel) -> Bool in
                questionModel.content != question.content
            }
        }
        else
        {
            var grade:ResultRating
            let gradeRate:Float = Float(rightAnwserCount)/Float(totalQuestion)

            if gradeRate < 0.1 {
                grade = .Poor
            }
            else if gradeRate >= 0.1 && gradeRate < 0.5{
                grade = .Fair
            }
            else if gradeRate >= 0.5 && gradeRate < 0.6{
                grade = .Good
            }
            else if gradeRate >= 0.6 && gradeRate < 0.9{
                grade = .VeryGood
            }
            else{
                grade = .Excellent
            }
            let resultView: ResultViewController = ResultViewController()
            resultView.resultModel = .init(totalQuestionsCount: totalQuestion, rightAnwsersCount: rightAnwserCount, rating: grade)
            //show(resultView, sender: self)
            present(resultView, animated: true, completion: nil)
        }
    }
}


struct AnswerModel:Decodable {
    let code:String
    let content:String
}
struct QuestionModel: Decodable {
    let content:String
    let result:String
    let answers:[AnswerModel]
}
struct ResultModel {
    let totalQuestionsCount:Int
    var rightAnwsersCount:Int
    let rating:ResultRating
}
enum ResultRating{
    case Poor
    case Fair
    case Good
    case VeryGood
    case Excellent
}
