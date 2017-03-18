//
//  CaptureViewController.swift
//  Imst
//
//  Created by Yawen on 17/3/2017.
//  Copyright © 2017 Ya-Wen Chu. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var capTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //picView.image = #imageLiteral(resourceName: "Placeholder")
        //capTextView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCaamera(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onLibrary(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func onPost(_ sender: Any) {
        if(picView.image != nil)
        {
            let image = picView.image
            let caption = capTextView.text
            
            Post.postUserImage(image: image, withCaption: caption, withCompletion: { (success: Bool, error: Error?) in
                if(success == true) {
                    //Dismiss HUD
                    //MBProgressHUD.hide(for: self.view, animated: true)
                    
                    
                    self.tabBarController?.selectedIndex = 0
                } else {
                    let errorAlertController = UIAlertController(title: "Error!", message: "Some error occured", preferredStyle: .alert)
                    let errorAction = UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction) in
                        //dismiss
                    })
                    errorAlertController.addAction(errorAction)
                    self.present(errorAlertController, animated: true)
                }
            })
        }
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        picView.image = editedImage
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
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
