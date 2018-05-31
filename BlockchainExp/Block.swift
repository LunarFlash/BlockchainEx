//
//  Block.swift
//  BlockchainEx
//
//  Created by Terry Wang on 5/4/18.
//  Copyright © 2018 Vento. All rights reserved.
//

import UIKit

/// Block object in a blockchain
class Block {

    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!

}

extension Block {
    /// Create a hash
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}
