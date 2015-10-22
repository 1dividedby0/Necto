//
//  QuestionsViewController.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/17/15.
//  Copyright © 2015 dhruv.mangtani. All rights reserved.
//

import UIKit
import Parse
var questions = NectoClient.get().questionsArray
var currentQuestion = Question()
class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(animated: Bool) {
        // initialize questions
        questions = NectoClient.get().questionsArray
        tableView.reloadData()
        print("WORKING")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete && isAdmin{
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            tableView.endUpdates()
            let currentSet = NectoClient.get()
            currentSet.questionsArray.removeAtIndex(indexPath.row)
            NectoClient.update(currentSet)
            questions = NectoClient.get().questionsArray
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(questions.count)
       return questions.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell") as! QuestionTableViewCell
        // get the question for the specified cell
        let question = questions[indexPath.row]
        // initialize all cell properties
        cell.questionLabel.text = question.question
        cell.nameLabel.text = question.user
        cell.answers = question.answers
        cell.questionIndex = indexPath.row
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetails"{
            let vc = segue.destinationViewController as! QuestionDetailsViewController
            // get the current Table View Cell
            let sender = sender as! QuestionTableViewCell
            // set the current question to current table view cell's question text
            vc.question = sender.questionLabel.text
            vc.answers = sender.answers
            vc.questionIndex = sender.questionIndex
            
            // set up question object for the vc
            let question = Question()
            question.question = vc.question
            question.answers = vc.answers
            vc.questionObject = question
            currentQuestion = Question()
        }
    }
}