//
//  ViewController.swift
//  NewsAPI
//
//  Created by Sri Chanakya Yennana on 10/12/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var textField: UITextField!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        swipeUP.direction = .up
        self.view.addGestureRecognizer(swipeUP)
        textField.delegate = self
        
    }

    @objc func swipeUp(){
        
    }
    
    
    
    @IBAction func passCategory(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NewsAPIConnector", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "NewsAPIConnector"{
            let destinationVC = segue.destination as! NewsUIController
            destinationVC.category = textField.text!
        }
        
        
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        self.performSegue(withIdentifier: "NewsAPIConnector", sender: self)
        return true
    }    
}

