//
//  TheHeapTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/1/2.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal
class TheHeapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeap_challenage() {
        let integers = [3, 10, 18, 5, 21, 100]
        var heap = Heap(sort: { (element1, element2) -> Bool in
            return element1 > element2
        }, elements: integers)
        let n = 3
//        guard n > 0 else {
//            return
//        }
        var current = 0
        for _ in 0...n {
            current = heap.remove() ?? 0
        }
        
        XCTAssertEqual(current, 10)
    }
}
