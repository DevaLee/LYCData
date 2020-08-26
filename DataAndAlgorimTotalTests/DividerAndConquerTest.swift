//
//  DividerAndConquerTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/8/23.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class DividerAndConquerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testMaxSubArrayOne(){
        let nums = [-2, -1, -3, 4, -1, 2, 1, -5, 4]
        let maxSum = DivideAndConquer.maxSubArrayOne(nums)

        XCTAssert(maxSum == 6)
        
    }

    func testMaxSubArrayTwo() {
        let nums = [-2, -1, -3, 4, -1, 2, 1, -5, 4]
        let maxSum = DivideAndConquer.maxSubArrayTwo(nums)

        XCTAssert(maxSum == 6)

    }
}
