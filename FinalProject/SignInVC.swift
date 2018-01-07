//
//  SignInVC.swift
//  FinalProject
//
//  Created by Romano on 07/12/2017.
//  Copyright © 2017 Romano. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    
    //label
    @IBOutlet weak var SignInLabel: UILabel!
    //text fields
    @IBOutlet weak var SignInUsermaneTxt: UITextField!
    @IBOutlet weak var SignInPasswordTxt: UITextField!
    
    //buttons
    @IBOutlet weak var SignInBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var ForgotPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Pacifico font of label
        SignInLabel.font = UIFont(name: "Pacifico", size: 25)
        
        
        //background
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "bg.jpg")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        

    }

    //click sign in button
    @IBAction func signInBtn_click(_ sender: Any) {
        print("sign in pressed")
        
        //hide keyboard
        self.view.endEditing(true)
        
        //if textfields are empty
        if SignInUsermaneTxt.text!.isEmpty || SignInPasswordTxt.text!.isEmpty{
            
                //show alert massage
                let alert = UIAlertController(title: "Please", message: "fill in fields", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            
        }
        else
        {
           Model.instance.login(email: SignInUsermaneTxt.text!, password: SignInPasswordTxt.text!, callback: { (answer) in
            if(answer == true)
            {
                print ("autenticated")
            }
            else{
                print("not autenticated")
                let alert = UIAlertController(title: "Error", message: "please check email and password", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
           })
            
        }
    }
}