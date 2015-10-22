//
//  NectoClient.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
import Parse
class NectoClient{
    static func update(questions: QuestionSet){
        let encodedObject = NSKeyedArchiver.archivedDataWithRootObject(questions)
        let query: PFQuery = PFQuery(className: "AWESOME")
        do{
        let main = try query.getObjectWithId("WGfEurqN3G")
            main["ALL"] = encodedObject
            try main.save()
        }catch{}
    }
    static func get() -> QuestionSet{
        var currentQuestionSet: QuestionSet!
        do{
            let data: AnyObject? = try PFQuery(className: "AWESOME").getObjectWithId("WGfEurqN3G")["ALL"]
            if let data: AnyObject = data{
                currentQuestionSet = NSKeyedUnarchiver.unarchiveObjectWithData(data as! NSData) as! QuestionSet
                return currentQuestionSet
            }
        }
        catch{
            print("NOT WORKING")
        }
        if currentQuestionSet != nil{
        return currentQuestionSet
        }else{
            return QuestionSet()
        }
    }
}