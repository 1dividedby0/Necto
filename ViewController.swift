//
//  ViewController.swift
//  Necto
//
//  Created by Dhruv Mangtani on 10/16/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//
import Parse
import UIKit
var userName: String = ""
var userEmail: String = ""
var isAdmin: Bool = false
class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var SignInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error == nil{
            userName = user.profile.name
            userEmail = user.profile.email
            if userEmail == "turbodhruv@gmail.com"{
                isAdmin = true
            }
            self.performSegueWithIdentifier("fromLogin", sender: self)
        }
    }
    @IBAction func SignIn(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}

