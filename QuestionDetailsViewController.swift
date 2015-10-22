//
//  QuestionDetailsViewController.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/18/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class QuestionDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerField: UITextView!
    var answers: [Answer]!
    var question: String!
    var questionObject: Question!
    var questionIndex: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(currentQuestion)
        questionLabel.text = question
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        answerField.delegate = self
        answerField.textColor = UIColor.grayColor()
        answerField.text = "Type your answer here"
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.blackColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Answer Cell") as! AnswerTableViewCell
        cell.answerLabel.text = answers[indexPath.row].user + ": " + answers[indexPath.row].answer
        cell.votes = answers[indexPath.row].votes
        cell.questionIndex = questionIndex
        cell.answerIndex = indexPath.row
        cell.votesLabel.text = "\(cell.votes)"
        cell.answer = answers[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(answers.count)
        return answers.count
    }
    
    @IBAction func postAction(sender: AnyObject) {
        let answer = Answer()
        answer.answer = answerField.text
        answer.user = userName
        answers.append(answer)
        let questionSet = NectoClient.get()
        for var i = 0; i < questionSet.questionsArray.count; i++ {
            if questionSet.questionsArray[i].question == question{
                questionSet.questionsArray[i].answers = answers
            }
        }
        NectoClient.update(questionSet)
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


