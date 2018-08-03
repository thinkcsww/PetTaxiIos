//
//  ViewController.swift
//  PetTaxiIos
//
//  Created by SunWoong Choi on 2018. 8. 3..
//  Copyright © 2018년 SunWoong Choi. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonClicked(_ sender: Any) {
        performSegue(withIdentifier: "goToStart", sender: self)
    }
}

