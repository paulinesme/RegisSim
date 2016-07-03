//
//  ListViewController.swift
//  RegisSim
//
//  Created by Pauline Sihawong on 7/3/16.
//  Copyright © 2016 Pauline Sihawong. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var prettyNumber = [RegistedSim(phoneNumber: "0929928432", citizenId: "11111"),
                        RegistedSim(phoneNumber: "0813930764", citizenId: "22222"),
                        RegistedSim(phoneNumber: "0800000000", citizenId: "33333")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    // MARK: - Utility
    func fetchData() {
        let session = URLSession(configuration: URLSessionConfiguration.default())
//        session.dataTask(with: URL(string: "https://ios-practice-11d74.firebaseio.com/record.json")!)
        
        let task = session.dataTask(with: URL(string: "https://ios-practice-11d74.firebaseio.com/record.json")!) { (data, response, error) in
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: [String: String]] {
                    
                    // Reset data everytime
                    self.prettyNumber = []
                    
                    // Add data in prettyNumber
                    for (key, value) in jsonObject {
                        print(key)
                        print(value)
                        
                        self.prettyNumber += [RegistedSim(phoneNumber: value["telephone"]!, citizenId: value["citizenId"]!)]
                    }
                    
                    DispatchQueue.main.async(execute: {
                        // Reload TableView
                        self.tableView.reloadData()
                    })
                    
                }
                
            } catch {
                print("error serialize")
            }
            
//            print(response)
//            print(error)
        }
        
        task.resume()   // ถ้าเราไม่เรียก code บรรทัดนี้ service ก้อยังไม่ถูกยิง
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prettyNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")   // Always return, even if cell not exist then automatically created new one?

        if let registedCell = cell as? RegistedSimTableViewCell {
            registedCell.phoneLabel.text = prettyNumber[indexPath.row].phoneNumber
            registedCell.citizenIdLabel.text = prettyNumber[indexPath.row].citizenId
        }
        
//        let phoneLabel = cell.viewWithTag(1) as? UILabel
//        let citizenIdLabel = cell.viewWithTag(2) as? UILabel
//        
//        phoneLabel?.text = prettyNumber[indexPath.row].phoneNumber
//        citizenIdLabel?.text = prettyNumber[indexPath.row].citizenId
        
//        cell.textLabel?.text = prettyNumber[indexPath.row].phoneNumber
//        cell.detailTextLabel?.text = prettyNumber[indexPath.row].citizenId
        
//        let prettyCount = prettyNumber.count
//        cell.textLabel?.text = prettyNumber[indexPath.row % prettyCount]
        
        return cell
    }
    
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row \(indexPath)")
    }

    // MARK: - Exit binding must start the name with "unwind
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        print(segue)
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
