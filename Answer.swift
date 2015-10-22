//
//  Answer.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
let ANSWER_USER = "WTF"
let ANSWER_KEY = "OMG"
class Answer: NSObject, NSCoding{
    var user: String = ""
    var answer: String = ""
    var votes: Int32 = 0
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(user, forKey: ANSWER_USER)
        aCoder.encodeObject(answer, forKey: ANSWER_KEY)
        aCoder.encodeInt(votes, forKey: "INT_KEY")
    }
    required init?(coder aDecoder: NSCoder) {
        self.user = aDecoder.decodeObjectForKey(ANSWER_USER) as! String
        self.answer = aDecoder.decodeObjectForKey(ANSWER_KEY) as! String
        self.votes = aDecoder.decodeInt32ForKey("INT_KEY")
    }
    
    override init(){}
}