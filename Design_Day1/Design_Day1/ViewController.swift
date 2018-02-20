//
//  ViewController.swift
//  Design_Day1
//
//  Created by MacStudent on 2018-02-20.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!

    @IBOutlet weak var txtMessage: UITextView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        
        var email = txtEmail.text!
        lblEmail.text = email
        
        var msg = txtEmail.text!
        var msg1 = txtNumber.text!
    
        txtMessage.text = "You are registered with : " + msg + " as user name and " + msg1 + " as Password"
    
        let infoAlert = UIAlertController(title: "Info", message: "This is your information", preferredStyle: .actionSheet)
        
        infoAlert.addAction(UIAlertAction(title: "Login", style: .default, handler: nil))
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(infoAlert, animated: true, completion: nil)
        
        
        
    }
    @IBOutlet weak var txtNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

