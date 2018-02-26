//
//  LoginVC.swift
//  LoginRegister
//
//  Created by Himauli on 2018-02-26.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet weak var switchRemember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getData()
        
        var path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        
        let folder = path[0] as String
        print("\(folder)/preferences")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnLoginAction(_ sender: UIBarButtonItem) {
    
        if authenicateUser() {
            
            //save data
            if self.switchRemember.isOn {
                self.saveData()
            }else{
                self.removeData()
            }
            
            //display next screen
            displayMenuScreen()
        }
        else{
            //get an instance of AlertController
            let infoAlert = UIAlertController(title: "Incorrect Data", message: "Email or Password incorrect...Please retry", preferredStyle: .alert)
            
            //add Retry button
            infoAlert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Default action"), style: .destructive, handler: nil))
            
            //display an alert
            self.present(infoAlert, animated: true, completion: nil)
        }
        /*
        let Email = txtEmail.text
        let Password = txtPassword.text
        
        if (Email == "test" && Password == "test"){
        
        let infoAlert = UIAlertController(title: "Login Sucessful", message: "You are authenticated", preferredStyle: .alert)
        
        infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
            self.present(infoAlert, animated: true, completion: nil)
    
        } */
    }
    
    func displayMenuScreen() {
        let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
        navigationController?.pushViewController(menuVC, animated: true)
    }
    
@IBAction func btnRegisterAction(_ sender: UIBarButtonItem) {
        
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegistrationScreen")
        
        //self.present(registerVC, animated: true, completion: nil)
        navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    func saveData()
    {
        UserDefaults.standard.set(self.txtEmail.text,forKey: "userName")
        UserDefaults.standard.set(self.txtPassword.text,forKey: "Password")
    }
    
    func  getData()
    {
        if let email = UserDefaults.standard.value(forKey: "userName"){
            self.txtEmail.text = email as? String
        }
        
        if let password = UserDefaults.standard.value(forKey: "password"){
            self.txtPassword.text = password as? String
        }
    }
    
    func removeData()
    {
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func authenicateUser() -> Bool{
        
        if (txtEmail.text == "himauli@gmail.com" && txtPassword.text == "patel"){
            return true
        }
        else{
            return false
        }
    }
}









