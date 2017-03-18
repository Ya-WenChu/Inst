//
//  ProfileViewController.swift
//  Imst
//
//  Created by Yawen on 17/3/2017.
//  Copyright © 2017 Ya-Wen Chu. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class ProfileViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
        
        PFUser.logOutInBackground { (error: Error?) in
                print("Successfully logged out")
                let relogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
                self.show(relogin!, sender: self)
                
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
