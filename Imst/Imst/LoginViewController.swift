//
//  LoginViewController.swift
//  Imst
//
//  Created by Yawen on 17/3/2017.
//  Copyright © 2017 Ya-Wen Chu. All rights reserved.
//

import UIKit
import Parse

extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signupBotton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "asses.png")!)
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        signupBotton.frame = CGRect(100, 100, 200, 40)
        signupBotton.setTitle("Sign Up", for: UIControlState.normal)
        signupBotton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signupBotton.backgroundColor = UIColor(white:0.000, alpha:0.07)
        signupBotton.layer.borderWidth = 1.0
        signupBotton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        signupBotton.layer.cornerRadius = cornerRadius
        
        signinButton.frame = CGRect(100, 100, 200, 40)
        signinButton.setTitle("Login", for: UIControlState.normal)
        signinButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signinButton.backgroundColor = UIColor(white:0.000, alpha:0.07)
        signinButton.layer.borderWidth = 1.0
        signinButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        signinButton.layer.cornerRadius = cornerRadius
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(_ sender: Any) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        // call sign up function on the object
        newUser.signUpInBackground { (succeded, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            
            }
        }
    }
    
    
    @IBAction func loginUser(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (response: PFUser?, error: Error?) in
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
