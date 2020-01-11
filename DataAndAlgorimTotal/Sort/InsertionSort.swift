//
//  InsertionSort.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/1/11.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation


/**
    Insertion sort will iterate once through the cards, from left to right.
    Each card is shifted to the left until it reaches its correct position
 
    the best case scenario for insertion sort occurs when the sequence of values are
    already in sorted order, and no left shifting is necessary
 */
public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count > 2 else {
        return
    }
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            }else {
                break
            }
        }
    }
}
