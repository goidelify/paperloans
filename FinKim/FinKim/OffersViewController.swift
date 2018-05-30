//
//  OffersViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 30.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

     let transactions = [("5.4%","50.000"),("5.32%","45.000"),("5.2%","20.000"),("5.105%","25.000"),
                         ("5.0%","7.000"), ("4.8%","60.000")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    @IBAction func ButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowContract", sender: nil)
    }
    
}

extension OffersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        let firstLabel = cell?.contentView.viewWithTag(1) as! UILabel
        let secondLabel = cell?.contentView.viewWithTag(2) as! UILabel
        firstLabel.text =  transactions[indexPath.row].0
        secondLabel.text = String(transactions[indexPath.row].1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
}
