//
//  ContractViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 30.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit

class ContractViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
            UIView.animate(withDuration: 1, animations: {
                self.button.alpha = 1
            })
            UIView.animate(withDuration: 1, animations: {
                self.button2.alpha = 1
            })
        }
    }

}

extension ContractViewController : UITextViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    
    
}
