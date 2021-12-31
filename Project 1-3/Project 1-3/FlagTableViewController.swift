//
//  FlagTableViewController.swift
//  Project 1-3
//
//  Created by John Padilla on 12/30/21.
//

import UIKit

class FlagTableViewController: UITableViewController {
    
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailsViewController {
            vc.countries = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
