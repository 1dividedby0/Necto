//
//  QuestionSet.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
let QUESTIONS_SET = "LMAO"
class QuestionSet: NSObject, NSCoding{
    var questionsArray: [Question] = []
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(questionsArray, forKey: QUESTIONS_SET)
    }
    required init?(coder aDecoder: NSCoder) {
        self.questionsArray = aDecoder.decodeObjectForKey(QUESTIONS_SET) as! [Question]
    }
    override init(){}
}