//
//  AnswerModel.swift
//  MilionaireApp
//
//  Created by Quoc Huy on 7/4/20.
//  Copyright © 2020 Quoc Huy. All rights reserved.
//

import Foundation


struct QuestionModel: Decodable {
    let content:String
    let result:String
    let answers:[AnswerModel]
}
