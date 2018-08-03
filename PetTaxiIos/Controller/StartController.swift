//
//  StartController.swift
//  PetTaxiIos
//
//  Created by SunWoong Choi on 2018. 8. 3..
//  Copyright © 2018년 SunWoong Choi. All rights reserved.
//

import UIKit

class StartController: UIViewController {

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
    @IBAction func customerButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "goToCustomerLogin", sender: self)
    }
    
    @IBAction func driverButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "goToDriverLogin", sender: self)
    }
    
    
}
