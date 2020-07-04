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
    
    // Time Label
    let timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        label.textColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.clipsToBounds = true
        label.layer.cornerRadius = 25
        return label
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
    
    // Line Col View 01
    let lineColumnView01 : UIView = {
       let view = UIView()
        view.initLikeAnColumnLine()
        return view
    }()
    
    // Line Col View 02
    let lineColumnView02 : UIView = {
       let view = UIView()
        view.initLikeAnColumnLine()
        return view
    }()
    
    // Line Row View 01
    let lineRowView01 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 02
    let lineRowView02 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 03
    let lineRowView03 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 04
    let lineRowView04 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 05
    let lineRowView05 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 06
    let lineRowView06 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 07
    let lineRowView07 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
    }()
    
    // Line Row View 08
    let lineRowView08 : UIView = {
       let view = UIView()
        view.initLikeAnRowLine()
        return view
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
            ShowResultImage(isCorrect: true)
        }
        else
        {
            ShowResultImage(isCorrect: false)
        }
        
      }

    fileprivate func ShowResultImage(isCorrect:Bool){
        var resultImageName = ""
        if isCorrect
        {
            resultImageName = "right-answer-icon"
            rightAnwserCount += 1
        }
        else
        {
            resultImageName = "wrong-answer-icon"
        }
        
        resultImage.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            self.resultImage.image = UIImage(named: resultImageName)
            self.resultImage.transform = .init(scaleX: 0.5, y: 0.5)
        }) { (result) in
            self.resultImage.isHidden = true
            self.resultImage.transform = .identity
            self.SetDataForObjectControl()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.337254902, blue: 0.4078431373, alpha: 1)
        
        //LimitedTimeCountDown()
        SetUpLayout()
        HandleJsonDataToQuestionModel()
        SetDataForObjectControl()
    }
    
    // MARK: Setup Auto Layout
    fileprivate func SetUpLayout()
    {
        // MARK: Add SubView
        view.addSubview(contentView)
        [timeLabel,questionLabel, answerAButton,answerBButton,answerCButton,answerDButton, resultImage, lineColumnView01,lineColumnView02,lineRowView01,lineRowView02,lineRowView03,lineRowView04,lineRowView05,lineRowView06,lineRowView07,lineRowView08].forEach { (item) in
            contentView.addSubview(item)
        }
        
        contentView.addSubview(resultImage)
        
        // MARK: Add Constrains
        // Content View
        NSLayoutConstraint.activate([contentView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor), contentView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)])
        contentView.layer.cornerRadius = contentView.frame.height/2
        
        // Time Label
        NSLayoutConstraint.activate([timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0), timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), timeLabel.widthAnchor.constraint(equalToConstant: 50), timeLabel.heightAnchor.constraint(equalToConstant: 50)])
        
        // Line Col View 01
        NSLayoutConstraint.activate([lineColumnView01.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 0), lineColumnView01.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor), lineColumnView01.heightAnchor.constraint(equalToConstant: 20)])
        
        // Question Label
        NSLayoutConstraint.activate([questionLabel.topAnchor.constraint(equalTo: lineColumnView01.bottomAnchor, constant: 0),questionLabel.centerXAnchor.constraint(equalTo: lineColumnView01.centerXAnchor), questionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9), questionLabel.heightAnchor.constraint(equalToConstant: 70)])
        
        // Line Col View 02
        NSLayoutConstraint.activate([lineColumnView02.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 0), lineColumnView02.centerXAnchor.constraint(equalTo: questionLabel.centerXAnchor), lineColumnView02.heightAnchor.constraint(equalToConstant: 50)])

        // Answer button A
       NSLayoutConstraint.activate([answerAButton.topAnchor.constraint(equalTo: lineColumnView02.bottomAnchor, constant: 0), answerAButton.centerXAnchor.constraint(equalTo: lineColumnView02.centerXAnchor), answerAButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7), answerAButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Line Row View 01
        NSLayoutConstraint.activate([lineRowView01.centerYAnchor.constraint(equalTo: answerAButton.centerYAnchor),lineRowView01.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), lineRowView01.trailingAnchor.constraint(equalTo: answerAButton.leadingAnchor, constant: 0)])

        // Line Row View 02
        NSLayoutConstraint.activate([lineRowView02.centerYAnchor.constraint(equalTo: answerAButton.centerYAnchor), lineRowView02.leadingAnchor.constraint(equalTo: answerAButton.trailingAnchor, constant: 0), lineRowView02.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
        
        // Answer button B
        NSLayoutConstraint.activate([answerBButton.topAnchor.constraint(equalTo: answerAButton.bottomAnchor, constant: 5), answerBButton.centerXAnchor.constraint(equalTo: answerAButton.centerXAnchor),answerBButton.leadingAnchor.constraint(equalTo: answerAButton.leadingAnchor), answerBButton.trailingAnchor.constraint(equalTo: answerAButton.trailingAnchor), answerBButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Line Row View 03
        NSLayoutConstraint.activate([lineRowView03.centerYAnchor.constraint(equalTo: answerBButton.centerYAnchor),lineRowView03.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), lineRowView03.trailingAnchor.constraint(equalTo: answerBButton.leadingAnchor, constant: 0)])

        // Line Row View 04
        NSLayoutConstraint.activate([lineRowView04.centerYAnchor.constraint(equalTo: answerBButton.centerYAnchor), lineRowView04.leadingAnchor.constraint(equalTo: answerBButton.trailingAnchor, constant: 0), lineRowView04.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
        
        // Answer button C
        NSLayoutConstraint.activate([answerCButton.topAnchor.constraint(equalTo: answerBButton.bottomAnchor, constant: 5), answerCButton.centerXAnchor.constraint(equalTo: answerBButton.centerXAnchor),answerCButton.leadingAnchor.constraint(equalTo: answerBButton.leadingAnchor), answerCButton.trailingAnchor.constraint(equalTo: answerBButton.trailingAnchor), answerCButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Line Row View 05
       NSLayoutConstraint.activate([lineRowView05.centerYAnchor.constraint(equalTo: answerCButton.centerYAnchor),lineRowView05.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), lineRowView05.trailingAnchor.constraint(equalTo: answerCButton.leadingAnchor, constant: 0)])

       // Line Row View 06
       NSLayoutConstraint.activate([lineRowView06.centerYAnchor.constraint(equalTo: answerCButton.centerYAnchor), lineRowView06.leadingAnchor.constraint(equalTo: answerCButton.trailingAnchor, constant: 0), lineRowView06.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
               
        // Answer button D
        NSLayoutConstraint.activate([answerDButton.topAnchor.constraint(equalTo: answerCButton.bottomAnchor, constant: 5), answerDButton.centerXAnchor.constraint(equalTo: answerCButton.centerXAnchor),answerDButton.leadingAnchor.constraint(equalTo: answerCButton.leadingAnchor), answerDButton.trailingAnchor.constraint(equalTo: answerCButton.trailingAnchor), answerDButton.heightAnchor.constraint(equalToConstant: 50)])
        
        // Line Row View 07
      NSLayoutConstraint.activate([lineRowView07.centerYAnchor.constraint(equalTo: answerDButton.centerYAnchor),lineRowView07.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), lineRowView07.trailingAnchor.constraint(equalTo: answerDButton.leadingAnchor, constant: 0)])

      // Line Row View 08
      NSLayoutConstraint.activate([lineRowView08.centerYAnchor.constraint(equalTo: answerDButton.centerYAnchor), lineRowView08.leadingAnchor.constraint(equalTo: answerDButton.trailingAnchor, constant: 0), lineRowView08.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
        
        // Result Image
        NSLayoutConstraint.activate([resultImage.centerXAnchor.constraint(equalTo: answerDButton.centerXAnchor), resultImage.topAnchor.constraint(equalTo: answerDButton.bottomAnchor, constant: 20), resultImage.widthAnchor.constraint(equalToConstant: 140), resultImage.heightAnchor.constraint(equalToConstant: 140),
                                     resultImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }
    
    var questionModels:[QuestionModel] = []
    var currentQuestionModel:QuestionModel?
    var totalQuestion = 0
    // MARK: Handel Json Data
    fileprivate func HandleJsonDataToQuestionModel() {
        do{
            guard let jsonData = jsonString.data(using: .utf8) else {return}
            questionModels = try JSONDecoder().decode([QuestionModel].self, from: jsonData)
            totalQuestion = questionModels.count
        }
        catch let jsonErr
        { print("Can not decode JsonString", jsonErr)}
    }
    
    // MARK: Set Data For Object Control
    fileprivate func SetDataForObjectControl()
    {
        
        currentQuestionModel = questionModels.randomElement()
        // Show question
        if let question = currentQuestionModel
        {
            timeLabel.text = "10"
            LimitedTimeCountDown()
            questionLabel.text = String(totalQuestion - questionModels.count + 1) + ". " + question.content
            answerAButton.setTitle("A. " + question.answers[0].content, for: .normal)
            answerBButton.setTitle("B. " + question.answers[1].content, for: .normal)
            answerCButton.setTitle("C. " + question.answers[2].content, for: .normal)
            answerDButton.setTitle("D. " + question.answers[3].content, for: .normal)
            
            questionModels = questionModels.filter { (questionModel) -> Bool in
                questionModel.content != question.content
            }
        }
        // Show Result if no more question left
        else
        {
            UIView.animate(withDuration: 1, animations: {
                self.contentView.transform = .init(scaleX: 10, y: 10)
            }) { (result) in
                var grade:ResultRating
                let gradeRate:Float = Float(self.rightAnwserCount)/Float(self.totalQuestion)

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
                resultView.resultModel = .init(totalQuestionsCount: self.totalQuestion, rightAnwsersCount: self.rightAnwserCount, rating: grade)
                //show(resultView, sender: self)
                self.present(resultView, animated: true, completion: nil)
            }
        }
    }
    
    
    // MARK: Limited Time Count Down
    var timeCountDown:Timer?
    func LimitedTimeCountDown() {
        guard timeCountDown == nil else { return }
        timeCountDown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LimitedTimeCountDown(sender:)), userInfo: nil, repeats: true)
    }
    @objc fileprivate func LimitedTimeCountDown(sender: Timer){
         var timeLabelValue = Int(self.timeLabel.text ?? "11")!
         let timer = Int(sender.timeInterval)
         timeLabelValue -= timer
         self.timeLabel.text = String(format: "%02d", timeLabelValue)
         
         if(timeLabelValue == 0)
         {
             self.timeCountDown?.invalidate()
             self.timeCountDown = nil
             self.ShowResultImage(isCorrect: false)
         }
     }
}


extension UIView{
    func initLikeAnColumnLine(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func initLikeAnRowLine(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 0.9450980392, blue: 0.8117647059, alpha: 1)
        heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}


