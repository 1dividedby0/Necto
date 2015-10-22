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
        //votesLabel.text = "\(questionSet.questionsArray[questionIndex].answers[answerIndex].votes)"
    }
    @IBAction func upVote(sender: AnyObject) {
        votes = votes+1
        questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
        NectoClient.update(questionSet)
        votesLabel.text = "\(votes)"
    }
    
    @IBAction func downVote(sender: AnyObject) {
        votes = votes-1
        questionSet.questionsArray[questionIndex].answers[answerIndex].votes = votes
        NectoClient.update(questionSet)
        votesLabel.text = "\(votes)"
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
