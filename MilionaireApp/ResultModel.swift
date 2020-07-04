//
//  AnswerModel.swift
//  MilionaireApp
//
//  Created by Quoc Huy on 7/4/20.
//  Copyright © 2020 Quoc Huy. All rights reserved.
//

import Foundation


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
