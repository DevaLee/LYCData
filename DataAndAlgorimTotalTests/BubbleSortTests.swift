//
//  BubbleSortTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/1/11.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class BubbleSortTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBubbleSort() {
        var  original = [9, 4, 10, 3]
        bubbleSort(&original)
        
        XCTAssertEqual(original, [3,4,9,10])
    }

}
