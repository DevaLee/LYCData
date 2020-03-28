//
//  DynamicPlanTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/3/28.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class DynamicPlanTest: XCTestCase {

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

    func testDynamic() {


        var array = [Int](repeating: -1, count: 9)

        let num = RecrusiveDynamicPlan.countWays(array.count - 1)
        let b = RecrusiveDynamicPlan.countWaysDP(array.count - 1, map: &array)

        XCTAssertEqual(num, b)

    }

}
