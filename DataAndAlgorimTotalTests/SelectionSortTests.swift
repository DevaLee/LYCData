//
//  SelectionSortTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/1/11.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal
class SelectionSortTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectionSort() {
        var array = [9, 4, 10, 3]
        bubbleSort(&array)
        
        XCTAssertEqual(array, [3, 4, 9, 10])
        
    }


    func testInsertSort() {
        var array = [9, 4, 10, 3]
        insertionSortTwo(&array)

        XCTAssertEqual(array, [3, 4, 9, 10])
    }

}
