//
//  ViewController.swift
//  FinKim
//
//  Created by Kim Stroem on 29.5.2018.
//  Copyright © 2018 Kim Stroem. All rights reserved.
//

import UIKit
import DigiMeSDK
import Foundation

class ViewController: UIViewController {

    var dmeClient: DMEClient = DMEClient.shared()
    
    @IBAction func presentNextVC() {
        dmeClient.delegate = self
        dmeClient.appId = "iuZLdNhhlzlfQU7XmTfd42861HLCDoUh"
        
        dmeClient.privateKeyHex = DMECryptoUtilities.privateKeyHex(fromP12File: "CA_RSA_PRIVATE_KEY", password: "digime")
        
        dmeClient.contractId = "FX9DpYm1l1CUfx7IFFa5LnFyu6aUhwYZ"
        dmeClient.authorize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        for view in self.view.subviews {
            print(view)
            if (view is UILabel)  {
                print("Animation was run")
                UIView.animate(withDuration: 1){
                    view.alpha = 1
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let vc = segue.destination as! CreditScoreControllerViewController
        }
    }
}

extension ViewController: DMEClientDelegate {
    
    func sessionCreated(_ session: CASession) {
    }
    
    func sessionCreateFailed(_ error: Error) {
        
    }
    
    func authorizeSucceeded(_ session: CASession) {
        self.performSegue(withIdentifier: "ShowLoadingPage", sender: nil)

    }
    
    func authorizeDenied(_ error: Error) {
    }
    
    func authorizeFailed(_ error: Error) {
    }
    
    func clientFailed(toRetrieveFileList error: Error) {
    }
    
    func clientRetrievedFileList(_ files: CAFiles) {
        
        for fileId in files.fileIds {
            dmeClient.getFileWithId(fileId)
        }
    }
    
    func fileRetrieved(_ file: CAFile) {
        if(file.fileId.split(separator: "_")[1] == "3"){
            print("file.fileId", file.json)
        }
    }
    
    func fileRetrieveFailed(_ fileId: String, error: Error) {
        print("Failed to find", fileId)
    }
    
    func accountsRetreived(_ accounts: CAAccounts) {
        
    }
    
    func accountsRetrieveFailed(_ error: Error) {
        
    }
}
