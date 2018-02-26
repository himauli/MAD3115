//
//  webpageVCViewController.swift
//  CustomTable
//
//  Created by Vaishnavi Gandhi on 2018-02-26.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import WebKit

class webpageVC: UIViewController {

    
    
    @IBOutlet weak var mywebview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    loadWebpage()
        // Do any additional setup after loading the view.
    //loadManualPage()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebpage(){
        let url = NSURL(string: "https://www.google.com")
       
        let requestObj = NSURLRequest(url: url! as URL)
        mywebview.load(requestObj as URLRequest)
    }

    func loadManualPage(){
        let localfilePath = Bundle.main.url(forResource: "mypizza", withExtension: "html")
        let myrequest = NSURLRequest(url: localfilePath!)
        mywebview.load(myrequest as URLRequest)
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
