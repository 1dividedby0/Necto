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
        let query: PFQuery = PFQuery(className: "QUESTIONS")
        do{
        let main = try query.getObjectWithId("nb3w1DR6aA")
            main["ALL"] = encodedObject
            main.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            }
        }catch{
                
        }
    }
    static func get() -> QuestionSet{
        var currentQuestionSet: QuestionSet!
        do{
            let data: AnyObject? = try PFQuery(className: "QUESTIONS").getObjectWithId("nb3w1DR6aA")["ALL"]
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