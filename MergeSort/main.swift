//
//  main.swift
//  MergeSort
//
//  Created by bumslap on 07/03/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import Foundation

let cards: [Card] = [
    Card(suit: .diamond, number: 7),
    Card(suit: .clover, number: 2),
    Card(suit: .spade, number: 6),
    Card(suit: .heart, number: 2),
    Card(suit: .heart, number: 100),
    Card(suit: .diamond, number: 9),
]

print(mergeSort(targetData: cards))

