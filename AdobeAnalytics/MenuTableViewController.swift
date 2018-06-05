//
//  MenuTableViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/4/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let menuItems = ["Simple Tracking"]
    let menuControllersIdentifiers = ["simpleTracking"]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: menuControllersIdentifiers[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
