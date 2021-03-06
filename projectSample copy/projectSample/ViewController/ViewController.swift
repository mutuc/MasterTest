//
//  ViewController.swift
//  projectSample
//
//  Created by Xcode User on 2020-02-28.
//  Copyright © 2020 kmutuc. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBAction func unwindToHomeViewController(segue : UIStoryboardSegue){
        
    }
    
    @IBOutlet var tfUsername : UITextField!
    @IBOutlet var tfPassword : UITextField!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
 
    @IBAction func loginOnClick(){
        
        let returnCode = mainDelegate.userIsAuthenitcated(username: tfUsername.text!, password: tfPassword.text!)
        
        var returnMSG : String = ""
        
        if returnCode == false {
            
            returnMSG = "User has failed to login try to register or double checking your credentials first before signing in."
            
            let alertController = UIAlertController(title: "Registration", message: returnMSG, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        } else {
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let abVC = storyboard.instantiateViewController(withIdentifier: "AddBookViewController") as! ViewController
            self.present(abVC, animated: true, completion: nil)
            
            
        }

    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().restorePreviousSignIn()
        
        
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
    }
    
 

}

