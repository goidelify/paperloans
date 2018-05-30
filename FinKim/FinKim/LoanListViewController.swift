//
//  LoanListViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 29.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit
import DigiMeSDK
import Foundation

class LoanListViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var score : Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let string:String = String(format:"%.2f", score!*1000)
        self.label.text = string + " kr"
        
        runThisAfterDelay(seconds: 2, queue: DispatchQueue.main){
            self.performSegue(withIdentifier: "ShowOffers", sender: nil)
        }
    }
    func runThisAfterDelay(seconds: Double, queue: DispatchQueue, after: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
