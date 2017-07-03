//
//  SecondViewController.swift
//  to-do-app
//
//  Created by Chanse Campbell on 03/07/2017.
//  Copyright © 2017 Chanse Campbell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemInputField: UITextField!
    
    @IBAction func itemAddButton(_ sender: Any) {
        
        self.view.endEditing(true)
        
        print(itemInputField.text)
        itemInputField.text = String()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

