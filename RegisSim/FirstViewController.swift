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
        self.navigationItem.title = "Registration"
    }
    
    // MARK: - Utility
    func postData(citizenId:String, telephone:String, completionHandler:()->Swift.Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default())
        
        let postJsonObject = ["citizenId":citizenId, "telephone":telephone]
        var request = URLRequest(url: URL(string: "https://ios-practice-11d74.firebaseio.com/record.json")!)
        request.httpMethod = "POST"
        
        do {
            let postJsonData = try JSONSerialization.data(withJSONObject: postJsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let task = session.uploadTask(with: request, from: postJsonData) { (data, response, error) in
                
                DispatchQueue.main.async(execute: {
                    completionHandler()
                })
            }
            
            task.resume()   // ถ้าเราไม่เรียก code บรรทัดนี้ service ก้อยังไม่ถูกยิง
        } catch {
            print("error serialize")
        }
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
    
    @IBAction func tapOnView(_ sender: AnyObject) {
        self.view.endEditing(true)
    }

    @IBAction func pressSubmitButton(_ sender: AnyObject) {
        
        if (citizenTextField.text != "" && telephoneTextField.text != "") {
            
            postData(citizenId: citizenTextField.text!, telephone: telephoneTextField.text!, completionHandler: {
                
                self.performSegue(withIdentifier: "registerSuccess", sender: nil)
            })
        }
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
