//
//  StackProgrammerTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/3/7.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest

@testable import DataAndAlgorimTotal

class StackProgrammerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetOfStacks()  {

        let stacks = SetOfStacks<Int>()
        stacks.push(1)
        stacks.push(2)
        stacks.push(3)
        stacks.push(4)


        let  value = stacks.pop()

        XCTAssertEqual(value, 4)

    }

}
