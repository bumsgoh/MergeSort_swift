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
    var sortedElements: [Element] = []
    var leftElements = left
    var rightElements = right

    while !leftElements.isEmpty && !rightElements.isEmpty {
        guard let leftFirst = leftElements.first,
            let rightFirst = rightElements.first else {
                return [Element]()
        }
        if leftFirst < rightFirst {
            sortedElements.append(leftFirst)
            leftElements.removeFirst()
        } else {
            sortedElements.append(rightFirst)
            rightElements.removeFirst()
        }
    }
    sortedElements.append(contentsOf: leftElements)
    sortedElements.append(contentsOf: rightElements)
    return sortedElements
}

func mergeSort<Element: Comparable>(targetData: [Element]) -> [Element] {
    
    guard targetData.count > 1 else {
        return [Element]()
    }
    
    let middle = targetData.count / 2
    var leftSide = Array(targetData[0..<middle])
    var rightSide = Array(targetData[middle..<targetData.count])
    
    if leftSide.count > 1 {
        leftSide =  mergeSort(targetData: leftSide)
    }
    
    if rightSide.count > 1 {
       rightSide = mergeSort(targetData: rightSide)
    }
    
    let mergedElements = merged(left: leftSide, right: rightSide)
    
    return mergedElements
}
