//
//  ViewController.swift
//  Project1
//
//  Created by John Padilla on 12/22/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var picture = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let item = try! fm.contentsOfDirectory(atPath: path)
        
        for item in item {
            if item.hasPrefix("nssl") {
                picture.append(item)
            }
        }
        print(picture)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picture[indexPath.row]
        return cell
    }

}

