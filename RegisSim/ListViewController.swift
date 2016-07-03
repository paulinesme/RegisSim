//
//  ListViewController.swift
//  RegisSim
//
//  Created by Pauline Sihawong on 7/3/16.
//  Copyright © 2016 Pauline Sihawong. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var prettyNumber = [RegistedSim(phoneNumber: "0929928432", citizenId: "11111"),
                        RegistedSim(phoneNumber: "0813930764", citizenId: "22222"),
                        RegistedSim(phoneNumber: "0800000000", citizenId: "33333")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
