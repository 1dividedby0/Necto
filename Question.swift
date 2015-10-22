//
//  Question.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
let ANSWERS_KEY = "JK"
let USER_KEY = "LOL"
class Question: NSObject, NSCoding{
    var answers: [Answer] = []
    var user: String = ""
    var question: String = ""
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(answers, forKey: ANSWERS_KEY)
        aCoder.encodeObject(user, forKey: USER_KEY)
        aCoder.encodeObject(question, forKey: "OMW")
    }
    required init?(coder aDecoder: NSCoder) {
        self.answers = aDecoder.decodeObjectForKey(ANSWERS_KEY) as! [Answer]
        self.user = aDecoder.decodeObjectForKey(USER_KEY) as! String
        self.question = aDecoder.decodeObjectForKey("OMW") as! String
    }
    override init(){}
}
