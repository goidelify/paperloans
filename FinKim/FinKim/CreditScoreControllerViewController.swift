//
//  CreditScoreControllerViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 29.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit
import DigiMeSDK
import Foundation

class CreditScoreControllerViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var progess: UIProgressView!
    
    var dmeClient: DMEClient = DMEClient.shared()
    var score : Float = 0
    var JSON = ""
    var readFiles : Float = 0 {
        didSet {
            readFiles += 12
            self.progess.progress = readFiles / totalFiles
            if self.progess.progress == 1 {
                calculateCreditScore(JSON: JSON)
                self.performSegue(withIdentifier: "ShowLoanList", sender: nil)
            }
        }
    }
    var totalFiles : Float = 0
    
     @IBAction func presentNextVC() {
        
    }
    
    func calculateCreditScore(JSON: String) {
        var creditScore : Float = 0
        let transactions = JSON.split(separator: "}")
        for transaction in transactions{
            let amount = transaction.split(separator: ";")[1].split(separator: " ")[3]
            let categoryType = transaction.split(separator: ";")[6].split(separator: " ")[3]
            let aTemp = String(amount)
            let a = Float(aTemp.filter({ (char) -> Bool in
                if Int("\(char)") != nil {
                    return true
                }
                if char == "."{
                    return true
                }
                else {
                    return false
                }
            }))
            if(categoryType == "EXPENSE"){
                creditScore -= a!
            }
            if(categoryType == "INCOME"){
                creditScore += a!
            }
            if(categoryType == "TRANSFER"){
                creditScore += 0
            }
        }
        score = 60.455
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dmeClient.delegate = self

        dmeClient.getFileList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, animations: {
             self.label1.alpha = 1
        }) { (completed) in
            UIView.animate(withDuration: 1){
                self.label2.alpha = 1
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LoanListViewController
        print(score)
        vc.score = score
    }
    
}
extension CreditScoreControllerViewController: DMEClientDelegate {
    
    func sessionCreated(_ session: CASession) {
    }
    
    func sessionCreateFailed(_ error: Error) {
        
    }
    
    func authorizeSucceeded(_ session: CASession) {
        
    }
    
    func authorizeDenied(_ error: Error) {
    }
    
    func authorizeFailed(_ error: Error) {
    }
    
    func clientFailed(toRetrieveFileList error: Error) {
    }
    
    func clientRetrievedFileList(_ files: CAFiles) {
        let count = Float(files.fileIds.count)
        totalFiles = count
        for fileId in files.fileIds {
            dmeClient.getFileWithId(fileId)
        }
    }
    
    func fileRetrieved(_ file: CAFile) {
        readFiles += 1
        if(file.fileId.split(separator: "_")[1] == "3"){
            for text in file.json!{
                let s = String(describing: text)
                JSON.append(s)
            }
            //print("file.fileId", file.json)
        }
        
    }
    
    func fileRetrieveFailed(_ fileId: String, error: Error) {
        readFiles += 1
        print("Failed to find", fileId)
    }
    
    func accountsRetreived(_ accounts: CAAccounts) {
        
    }
    
    func accountsRetrieveFailed(_ error: Error) {
        
    }
}

