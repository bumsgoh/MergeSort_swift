//
//  Model.swift
//  MergeSort
//
//  Created by bumslap on 07/03/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import Foundation

struct Card: Comparable {
    let suit: Suit
    let number: Int
    
    static func < (lhs: Card,
                   rhs: Card) -> Bool {
        return lhs.number < rhs.number
    }
}

enum Suit {
    case spade
    case diamond
    case heart
    case clover
}

func merged<Element: Comparable>(left: [Element], right: [Element]) -> [Element] {
    var sortedCards: [Element] = []
    var leftCards = left
    var rightCards = right

    while !leftCards.isEmpty && !rightCards.isEmpty {
        guard let leftFirst = leftCards.first,
            let rightFirst = rightCards.first else {
                return [Element]()
        }
        if leftFirst < rightFirst {
            sortedCards.append(leftFirst)
            leftCards.removeFirst()
        } else {
            sortedCards.append(rightFirst)
            rightCards.removeFirst()
        }
    }
    sortedCards.append(contentsOf: leftCards)
    sortedCards.append(contentsOf: rightCards)
    return sortedCards
}

func mergeSort<Element: Comparable>(array: [Element]) -> [Element] {
    
    guard array.count > 1 else {
        return [Element]()
    }
    
    let middle = array.count / 2
    var leftSide = Array(array[0..<middle])
    var rightSide = Array(array[middle..<array.count])
    
    if leftSide.count > 1 {
        leftSide =  mergeSort(array: leftSide)
    }
    
    if rightSide.count > 1 {
       rightSide = mergeSort(array: rightSide)
    }
    
    let mergedCards = merged(left: leftSide, right: rightSide)
    
    return mergedCards
}
