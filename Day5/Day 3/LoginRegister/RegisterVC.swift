//
//  RegisterVC.swift
//  LoginRegister
//
//  Created by Himauli on 2018-02-26.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var tctContactNumber: UITextField!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var cityList: [String] = ["Vancouver", "Ottawa", "Toronto", "Calgary", "Windsor", "Ajax", "Pickering", "Admenton", "Jasper", "Quebec", "Alberta", "British Columbia", "Montreal"]
    
    var selectedCityIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Register"
        
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(displayValues))
        
        self.navigationItem.rightBarButtonItem = btnSubmit
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView,    numberOfRowsInComponent component: Int) -> Int {
        return self.cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityList[row]
    }
    
    @objc private func displayValues(){
        
        self.selectedCityIndex = self.cityPicker.selectedRow(inComponent: 0)
        
        let allData: String = "\(self.txtName.text!) \n \(self.tctContactNumber.text!) \n \(self.datePicker.date) \n \(self.cityList[selectedCityIndex]) \n \(self.txtPostalCode.text!) \n \(self.txtEmail.text!)"
        
        let infoAlert = UIAlertController(title: "Verify your details", message: allData, preferredStyle: .actionSheet)
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayMenuScreen()}))
        
        // let infoAlert = UIAlertController(title: "Verify", message: "Please verify your details", preferredStyle: .alert)
        
        // infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayWelcomeScreen()}))
        
        self.present(infoAlert, animated: true)
    }
    
    /*
    func displayWelcomeScreen(){
        let welcomeSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: "WelcomeScreen") as! WelcomeVC
        
        
        welcomeVC.welcomeTitle = txtName.text!
    navigationController?.pushViewController(welcomeVC, animated: true)
    }
 */
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cityPicker.delegate = self
        
        self.cityPicker.dataSource = self
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
    
    @objc func displayMenuScreen() {
        let newCustomer = Customer(self.txtName.text!, self.tctContactNumber.text!, self.datePicker.date, self.cityList[selectedCityIndex], self.txtPostalCode.text!, self.txtEmail.text!, self.txtPassword.text!)
        
        if Customer.addCustomer(cust: newCustomer){
            let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
            navigationController?.pushViewController(menuVC, animated: true)}
        else{
            print("Something goes wrong")
        }
    }

}
