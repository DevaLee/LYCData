//
//  BinarySearchTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/1/2.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class BinarySearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBinarySearchFunc_whenUnsorted() {
        let array = [5,2,7,1,9,8,6,3]
        let number = array.binarySearch(for: 5, in: array.startIndex..<array.endIndex)
        
        let index = array.firstIndex(of: 5)
        
        XCTAssertEqual(number,  index)
    }
    
    func testBinarySearch_sorted() {
        let array = [1,2,3,4,5,6,7,8,9]
        let number = array.binarySearch(for: 5, in: array.startIndex..<array.endIndex)
        let index = array.firstIndex(of: 5)
        XCTAssertEqual(number,  index)
    }

}
