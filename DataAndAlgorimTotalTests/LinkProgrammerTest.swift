//
//  LinkProgrammerTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/2/25.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class LinkProgrammerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLinkDepu() {
        var linkList = LinkedList<String>()
        linkList.append("a")
        linkList.append("a")
        linkList.append("b")
        linkList.append("c")
        linkList.append("d")
        linkList.append("d")
        linkList.append("d")
        linkList.append("e")
        linkList.append("f")
        linkList.append("l")
        
        
        LinkProgrammer.deleteDups(link: linkList)
        print(linkList)
        XCTAssertFalse(checkHaveDeption(link: linkList))
    
    }
    
    
    func testLinkDepuTwo() {
         var linkList = LinkedList<String>()
         linkList.append("a")
         linkList.append("a")
         linkList.append("a")
         linkList.append("b")
         linkList.append("a")
         linkList.append("b")
         linkList.append("e")
         linkList.append("c")
         linkList.append("b")
         LinkProgrammer.deleteDups(link: linkList)
         print(linkList)
         XCTAssertFalse(checkHaveDeption(link: linkList))
     
     }
    
    //  a -> a ->a -> b -> a ->b -> e -> c ->b
    
    func checkHaveDeption<T: Hashable>(link: LinkedList<T>) -> Bool {
        var dict :[T: Bool] = [:]
        var traceNode = link.head
        
        var contain: Bool = false
        while let node = traceNode {
            if dict.keys.contains(node.value) {
                contain = true
                break
            }else {
                dict[node.value] = true
            }
            traceNode = traceNode?.next
        }
    
        return contain
    }
    
    func testNthValue() {
        var linkList = LinkedList<String>()
        linkList.append("a")
        linkList.append("b")
        linkList.append("c")
        linkList.append("d")
        linkList.append("e")
        linkList.append("f")
        linkList.append("g")
        linkList.append("h")
        linkList.append("i")
        
        let result =  LinkProgrammer.nthNode(link: linkList, atIndex: 9)
        XCTAssertEqual("i", result)
    }
    
    
    func testSepValue(){
        var linkList = LinkedList<Int>()
        linkList.append(1)
        linkList.append(9)
        linkList.append(5)
        linkList.append(8)
        linkList.append(3)
        linkList.append(7)
        linkList.append(6)
        linkList.append(2)
        linkList.append(4)
        
        let newLink = LinkProgrammer.seperateLinklist(linkList: linkList, by: 5)
        print(newLink)
        
        XCTAssertNotNil(newLink)
    }
    
    
    
    func testListAdd()  {
        var linkListOne = LinkedList<Int>()
        linkListOne.append(7)
        linkListOne.append(1)
        linkListOne.append(6)
        
        var linkListTwo = LinkedList<Int>()
        linkListTwo.append(5)
        linkListTwo.append(9)
        linkListTwo.append(2)
        linkListTwo.append(1)
        linkListTwo.append(6)
        
        var finalLink = LinkedList<Int>()
        finalLink.append(2)
        finalLink.append(1)
        finalLink.append(9)
        
        
        let newLink = LinkProgrammer.addList(linkOne: linkListOne, linkTwo: linkListTwo)
        print(newLink)
        XCTAssertNotNil(newLink)
        
    }
    
    
    func testAddListReverse() {
        var linkListOne = LinkedList<Int>()
        linkListOne.append(7)
        linkListOne.append(1)
        linkListOne.append(6)
        
        var linkListTwo = LinkedList<Int>()
        linkListTwo.append(5)
        linkListTwo.append(9)
        linkListTwo.append(2)
        linkListTwo.append(1)
        linkListTwo.append(6)
        
        let newNode = LinkProgrammer.addListReverse(linkOne: linkListOne, linkTwo: linkListTwo)
        
        print(newNode)
        
        XCTAssertNotNil(newNode)
        
    }
    
    func testCircleLinkFalse(){
        let node1 = Node(value: 1)
        let node2 = Node(value: 1)
        let node3 = Node(value: 2)
        let node4 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        XCTAssertFalse(LinkProgrammer.checkLinkIsCircle(node: node1))
        
        
    }
    
    func testCircleLinkTrue() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 1)
        let node3 = Node(value: 2)
        let node4 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node1
        
        XCTAssertTrue(LinkProgrammer.checkLinkIsCircle(node: node1))
    }
    
    
    func testCircleBegin(){
        let node1 = Node(value: 1)
        let node2 = Node(value: 1)
        let node3 = Node(value: 2)
        let node4 = Node(value: 3)
        let node5 = Node(value: 5)
        let node6 = Node(value: 4)
        let node7 = Node(value: 2)
        let node8 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node8
        node8.next = node3
        
        XCTAssertEqual(node3, LinkProgrammer.findBegining(linkNode: node1))
    }
    
    
    func testIsPlindrome() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node9 = Node(value: 8)
        let node5 = Node(value: 4)
        let node6 = Node(value: 3)
        let node7 = Node(value: 2)
        let node8 = Node(value: 1)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node9
        node9.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node8
        
        XCTAssertTrue(LinkProgrammer.isPalindrome(node: node1))
    }
}
