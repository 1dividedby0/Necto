//
//  AnswerTableViewCell.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/19/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    var votes: Int32!
    var questionSet = NectoClient.get()
    var questionIndex: Int!
    var answerIndex: Int!
    var answer: Answer!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func upVote(sender: AnyObject) {
        if answer.usersAndLikes[userEmail] == nil{
            answer.usersAndLikes[userEmail] = Like.Like.rawValue
            votes!++
            votesLabel.text = "\(votes)"
            questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
            questionSet.questionsArray[questionIndex].answers[answerIndex] = answer
            NectoClient.update(questionSet)
        }else if answer.usersAndLikes[userEmail] != Like.Like.rawValue{
            // if the user has unliked this and wants to go to neutral
            if answer.usersAndLikes[userEmail] == Like.Unlike.rawValue{
                answer.usersAndLikes[userEmail] = Like.Neutral.rawValue
            // else if the user is on neutral and wants to like it
            }else{
                answer.usersAndLikes[userEmail] = Like.Like.rawValue
            }
            votes!++
            votesLabel.text = "\(votes)"
            questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
            questionSet.questionsArray[questionIndex].answers[answerIndex] = answer
            NectoClient.update(questionSet)
        }
    }
    
    @IBAction func downVote(sender: AnyObject) {
        if answer.usersAndLikes[userEmail] == nil{
            answer.usersAndLikes[userEmail] = Like.Unlike.rawValue
            votes!--
            votesLabel.text = "\(votes)"
            questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
            questionSet.questionsArray[questionIndex].answers[answerIndex] = answer
            NectoClient.update(questionSet)
        }else if answer.usersAndLikes[userEmail] != Like.Unlike.rawValue{
            votes!--
            votesLabel.text = "\(votes)"
            // if the user is going to unlike from neutral
            if answer.usersAndLikes[userEmail] == Like.Neutral.rawValue{
                answer.usersAndLikes[userEmail] = Like.Unlike.rawValue
            }
            // if the user is going to neutral from like
            else if answer.usersAndLikes[userEmail] == Like.Like.rawValue{
                answer.usersAndLikes[userEmail] = Like.Neutral.rawValue
            }
            questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
            questionSet.questionsArray[questionIndex].answers[answerIndex] = answer
            NectoClient.update(questionSet)
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
enum Like: Int{
    case Like = 0
    case Unlike = 1
    case Neutral = 2
}
