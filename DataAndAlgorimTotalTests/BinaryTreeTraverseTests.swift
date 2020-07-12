//
//  BinaryTreeTraverseTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/7/12.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class BinaryTreeTraverseTests: XCTestCase {

    var tree: BinaryTree<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        let eleven = BinaryNode(value: 11)

        seven.leftChild = one
        one.parentNode = seven
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.parentNode = seven
        nine.leftChild = eight

        zero.parentNode = one
        five.parentNode = one
        eight.parentNode = nine

        var tree = BinaryTree<Int>()
        tree.root = seven
        return tree

        /*
              7
            /    \
           1      9
         / \     /
        0   5   8
        */

    }()



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


    func testPreorderTraversNoRecusive() {

        var array = [Int]()
        tree.traversPreorderUnrecusive { (value) in
            array.append(value)
        }

        XCTAssert(array == [7,1,0,5,9,8])
    }

    func testInorderTraversNoRecusive() {
        var array = [Int]()
        tree.traversInorderNoRecrusive { (value) in
            array.append(value)
        }

        XCTAssert(array == [0, 1, 5, 7, 8, 9])
//        tree.
    }

}
