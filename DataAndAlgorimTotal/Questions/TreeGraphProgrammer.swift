//
//  TreeGraphProgrammer.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/3/22.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation



class TreeGraphProgrammer {

    //MARK: -- 检查二叉树是否平衡
    // 任意一个节点，其两颗子树的高度差不超过1
    static func checkTreeBalance<T>(_ tree: BinaryNode<T>) -> Bool{
        if checkHeight(tree) == -1 {

            return false
        } else {
            return true
        }

    }


    static private func checkHeight<T>(_ root: BinaryNode<T>?) -> Int{

        if root == nil {
            return 0
        }

        /*检查左子树是否平衡*/
        let leftHeight = checkHeight(root?.leftChild)
        if leftHeight == -1 {
            return -1
        }

        /*检查右子树是否平衡*/
        let rightHeight = checkHeight(root?.rightChild)
        if rightHeight == -1 {
            return -1
        }

        /*检查当前节点是否平衡*/
        let heightDiff = leftHeight - rightHeight
        if abs(heightDiff) > 1 {

            return -1
        } else {
            /*返回高度*/
            return max(leftHeight, rightHeight) + 1
        }
    }
    
    
//    static func createMinimalBST<T>( arr: [BinaryNode<T>], start: Int, end: Int) -> BinaryNode<T>? {
//        
//        if end < start {
//            return nil
//        }
//        
//        let mid = (start + end) / 2
//        le
//    }

}
