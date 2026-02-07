//
//  ViewController.swift
//  HelloUIKit
//
//  Created by Alumno on 4/2/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageButton: UILabel!
    @IBOutlet weak var Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View controller code")
        
        Name.text = "Adriana Caballero Manuel"
    }
    
    
    @IBAction func modifyMessageButton(_ sender: UIButton) {
        print("Button tapped")
        messageButton.text = """
* Certificate in Information Technology
* Handicraft Sales Application
"""

    }
    
}

