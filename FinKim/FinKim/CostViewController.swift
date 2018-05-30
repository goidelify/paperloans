//
//  CostViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 30.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit

class CostViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var finalCost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    @IBAction func interestChanged(_ sender: Any) {
        let f = (text1.text! as NSString).floatValue
        let g = (text2.text! as NSString).floatValue
        finalCost.text = String(format: "%.2f", f*g + f)
    }
    
    @IBAction func amountChanged(_ sender: Any) {
        let f = (text1.text! as NSString).floatValue
        let g = (text2.text! as NSString).floatValue
        finalCost.text = String(format: "%.2f", f*g + f)
    }
    
}
