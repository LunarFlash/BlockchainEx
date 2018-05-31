//
//  Blockchain.swift
//  BlockchainEx
//
//  Created by Terry Wang on 5/4/18.
//  Copyright © 2018 Vento. All rights reserved.
//

import UIKit

/// Representation of a blockchain
class Blockchain {
    /// A conected chain of Blocks
    var chain = [Block]()

}

extension Blockchain {

    /// Create a genesis block for this Blockchain
    func createGenesisBlock(data: String) {
        let genesisBlock = Block()
        genesisBlock.hash = genesisBlock.generateHash()
        genesisBlock.data = data
        genesisBlock.previousHash = "0000"
        genesisBlock.index = 0
        chain.append(genesisBlock)
    }

    /// Create a new block in the Blockchain
    func createBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
}
