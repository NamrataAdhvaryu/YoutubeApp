//
//  LoginVC.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 07/04/21.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInDelegate {
    var googleSignIn = GIDSignIn.sharedInstance()
 
    @IBOutlet weak var txtpwd: UITextField!
    @IBOutlet weak var txtemailid: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        self.signInButton.layer.cornerRadius = 10.0
          // Automatically sign in the user.
          GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
      GIDSignIn.sharedInstance().signOut()
    }

    @IBAction func userloginbtn(_ sender: Any) {
        
        Commoncode().pushVCwithoutanimation(acurrentvc: self, anextvcidentifier: "channelidentifier")
    }
    
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
          withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            Commoncode().pushVCwithoutanimation(acurrentvc: self, anextvcidentifier: "channelidentifier")
        }
    }

}







    





    
    
   

    
    

    
    
    
    
    
