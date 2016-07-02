//
//  SecondViewController.swift
//  RegisSim
//
//  Created by Pauline Sihawong on 7/2/16.
//  Copyright © 2016 Pauline Sihawong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var telephone: String?
    var citizenId: String?

    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var citizenIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Success!"
        
        print(telephone, ",", citizenId)
        
        if (telephone != nil) {
//            telephoneLabel.text = "Telephone : \(telephone!)"
            telephoneLabel.text = "Telephone :" + telephone!    // Better for localization
        }
        
        if (citizenId != nil) {
//            citizenIdLabel.text = "Citizen ID : \(citizenId!)"
            citizenIdLabel.text = "Citizen ID :" + citizenId!   // Better for localization
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToFirstView(_ sender: AnyObject) {
        
        self.navigationController?.popViewController(animated: true)
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
