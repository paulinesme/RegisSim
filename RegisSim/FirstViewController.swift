//
//  FirstViewController.swift
//  RegisSim
//
//  Created by Pauline Sihawong on 7/2/16.
//  Copyright © 2016 Pauline Sihawong. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var citizenTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if let secondVC = segue.destinationViewController as? SecondViewController {
            
            secondVC.telephone = telephoneTextField.text
            secondVC.citizenId = citizenTextField.text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
