//
//  ViewController.swift
//  BlockchainEx
//
//  Created by Terry Wang on 4/29/18.
//  Copyright © 2018 Vento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueAmount: UITextField!
    @IBOutlet weak var redAmount: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!

    let firstAccount = 1065
    let secondAccount = 0217
    let bitcoinChain = Blockchain()
    let reward = 100
    var accounts: [String: Int] = ["0000": 10000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction",
                                         message: "Please check the details of your transaction as we were unable to process this.",
                                         preferredStyle: .alert)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redMine(_ sender: Any) {
        
    }
    
    @IBAction func blueMine(_ sender: Any) {
        
    }
    
    @IBAction func redSend(_ sender: Any) {
        
    }
    
    @IBAction func blueSend(_ sender: Any) {
        
    }
    
}

extension ViewController {
    /// Process a transaction between two accounts
    /// - Parameter from: The account the amount is coming from
    /// - Parameter to:" The account the amount is transfered to
    /// - Parameter amount: The amount being transfered
    /// - Parameter type: The type of transaction: "genesis" or "normal"
    func transaction(from: String, to: String, amount: Int, type: String) {
        if accounts[from] == nil {
            present(invalidAlert, animated: true, completion: nil)
            return
        } else if accounts[from]! - amount < 0 {
            present(invalidAlert, animated: true, completion: nil)
            return
        } else {
            accounts.updateValue(amount, forKey: to)
        }
        if type == "genesis" {
            bitcoinChain.createGenesisBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        } else if type == "normal" {
            bitcoinChain.createBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        }
    }
}


extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
