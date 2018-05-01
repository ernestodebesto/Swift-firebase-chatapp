//
//  VClogin.swift
//  iChat
//
//  Created by Filip Sikora on 06/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit

class VClogin: UIViewController {

    @IBOutlet weak var textName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "chat", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chat" {
            if let destination = segue.destination as? ViewController {
                destination.loginName = textName.text
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
