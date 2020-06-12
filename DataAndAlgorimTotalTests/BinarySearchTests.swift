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

    var tree: BinaryNode<Int> = {
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


        return seven
        /*
            7
         /    \
         1      9
        / \     /
       0    5   8
         */

    }()

    var bstTree: BinarySearchTree<Int> = {
        var bst = BinarySearchTree<Int>()


//        let zero = BinaryNode(value: 0)
//        let one = BinaryNode(value: 1)
//        let five = BinaryNode(value: 5)
//        let seven = BinaryNode(value: 7)
//        let eight = BinaryNode(value: 8)
//        let nine = BinaryNode(value: 9)
//        let eleven = BinaryNode(value: 11)
//
//        seven.leftChild = one
//        one.leftChild = zero
//        one.rightChild = five
//        seven.rightChild = nine
//        nine.leftChild = eight

        bst.insert(7)
        bst.insert(1)
        bst.insert(9)
        bst.insert(0)
        bst.insert(5)
        bst.insert(8)
        bst.insert(11)
        /*
                 7
              /    \
            1         9
           / \      /  \
         0    5    8    11


         */


        return bst

    }()



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


    func testSameLevelTravse() {

        print(tree)

        print("#########")
        tree.traverSameLevel { (value) in
            print(value!)
        }

        XCTAssert(true)
    }


    func testTreeHeight() {
        let height = tree.treeHeight()

        XCTAssert(height == 3)
    }

     func testisValidBST(){
        //let obj = NSObject()
        let valid = NSObject.isValidBST(tree)
        XCTAssert(valid == true)

    }

    func testTreeHeightIterator() {
        let height = tree.treeHeightIteration()

        XCTAssert(height == 4)
    }

    func testFullBinaryTree() {
        let isFullTree = tree.isFullBinaryNode()

        XCTAssert(isFullTree == true)

    }

    // 反转二叉树
    func testReverseBinaryTree() {
        print(tree)
        tree.traversePreOrderNode { (node) in
            let left = node.leftChild
            node.leftChild = node.rightChild
            node.rightChild = left
        }
        print(tree)
    }

    /*
                  7
                /    \
              1         9
             / \      /  \
           0    5    8   11
    */

    func testProcessorNode() {

        print(tree)

        var node: BinaryNode<Int> = BinaryNode(value: 7)
        tree.traversePreOrderNode { (inNode) in
            if node.value == inNode.value {
                node = inNode
            }
        }
        let processNode = tree.processorNode(node)

        print(processNode?.value as Any)
        XCTAssert(processNode?.value == 5)

    }
    /*
                  7
                /    \
              1         9
             / \      /
           0    5    8
    */
    func testSuccessor() {
        //print(tree)

        var node: BinaryNode<Int> = BinaryNode(value: 9)
        tree.traversePreOrderNode { (inNode) in
            if node.value == inNode.value {
                node = inNode
            }
        }
        let processNode = tree.successorNode(node)

        tree.traverSameLevel{ (value) in
            print(value!)
        }

       // print(processNode?.value as Any)
        XCTAssert(processNode?.value == nil)


    }
}
