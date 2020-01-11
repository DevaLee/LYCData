//
//  SelectionSort.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/1/11.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

// SelectionSort follows the basic idea of bubble sort, but improves upon this algorithm
// by reducing the number of swapAt operations,SelectionSort will only swap at the end of
// each pass
public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count > 2 else {
        return
    }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
    
    
}
