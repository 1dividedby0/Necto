//
//  QuestionTableViewCell.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var name: String!
    var question: String!
    var answers: [Answer]!
    var questionIndex: Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //print(question)
        //print(name)
        questionLabel.text = question
        nameLabel.text = name
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
