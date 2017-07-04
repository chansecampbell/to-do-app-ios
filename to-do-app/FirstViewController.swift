//
//  FirstViewController.swift
//  to-do-app
//
//  Created by Chanse Campbell on 03/07/2017.
//  Copyright © 2017 Chanse Campbell. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var items: [String] = []

    // attempts to fetch an array of items once the view loads
    func returnToDos() {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let protoCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ProtoCell")
        
        protoCell.textLabel?.text = items[indexPath.row]
        
        return protoCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // needs to be added in order to reload data on the fly
    override func viewDidAppear(_ animated: Bool) {
        returnToDos()
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.setValue(items, forKey: "items")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

