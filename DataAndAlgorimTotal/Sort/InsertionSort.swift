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
    guard array.count > 1 else {
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


public func insertionSortTwo<Element>(_ array: inout [Element]) where Element: Comparable {

    guard array.count > 1 else {
        return
    }

    print("Array: \(array)")
    for begin in (1..<array.count) {
        // 找到要插入的位置
        let des = search(begin, array)
        print("begin: \(begin), des: \(des)")
        // 插入元素
        insert(begin, des, &array)
    }
}
/*
 将 source 位置的元素插入到dest位置
 */
private func insert<Element>(_ source: Int, _ dest: Int, _ sourceArray: inout [Element]) where Element: Comparable{
    // 对source处的值进行备份
    let e = sourceArray[source]

    if dest == source {
        print("排序后的Array: \(sourceArray)")
        return
    }

    // 将 [dest, source)区间的元素后移
    for i in (dest...source).reversed() where i > 0 {
        sourceArray[i] = sourceArray[i - 1]
    }

    sourceArray[dest] = e

    print("排序后的Array: \(sourceArray)")

}

/*
 利用二分搜索找到 index位置元素的待插入位置
 已经排好序数组的范围时 [0, index)
 */
private func search<Element>(_ index: Int, _ sourceArray: [Element]) -> Int where Element: Comparable {
    var begin = 0
    var end = index

    // 当 begin == end 时，查找结束，这时的 begin 就是插入位置的索引。
    while begin < end {
        let mid = (begin + end) >> 1
        if sourceArray[index] < sourceArray[mid] {
            end = mid
        } else {
            begin = mid + 1
        }
    }
    return begin;
}
