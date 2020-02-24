//
//  Programmers.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/21.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import UIKit

class Programmers :NSObject{
    /*
      Q ：确定一个字符串的所有字符是否全都不同，假使不允许使用额外数据结构，又该如何处理
      A ：将字符集转化为unicode值，初始化一个容量为 255的数组，存放BOOL类型的数据，将unicode值作为索引
         Time O(n), Space O(1)
     */
    static func isUniqueChar(str: String) -> Bool{
        // 假定字符集为ASCII
        if str.count > 256 {
            return false
        }
        //将字符集转化为unicode值，初始化一个容量为 255的数组，存放BOOL类型的数据，将unicode值作为索引
        var charSet :[Bool?] = [Bool?](repeating: nil, count: 255);
        for scalar in str.unicodeScalars {
            let val = Int(scalar.value)
            if charSet[val] ?? false {
                return false
            }
            charSet[val] = true
        }
        return true
    }
    
    //String --> 数组 --> String
    static func reverse(str: String) -> String {
        var array = Array(str)
       
        for (i, _) in str.enumerated() {
          
            if i < str.count / 2 {
                array.swapAt(i, str.count - i - 1)
            }else {
                break
            }
        }

        return String(array)
    }
    
    //MARK: -- 判断两个字符串，排序后是否相等
    static func sort(_ s: String) -> String {
        
        var content = Array(s)
        
        content.sort()
        
        return String(content)
    }
    
    static func permutation(s1: String, s2: String) -> Bool {
        if s1.count != s2.count {
            return false
        }
        
        return sort(s1) == sort(s2)
    }
    
    //MARK: -- 将字符串中的空格全部替换为“%20”
    /*
      1,遍历字符串，统计空格的数量 spaceCount
      2，生成长度为str.count + spaceCount 的数组newArray
      3，向newArray中填充字符 --> 字符串
     */
    static func replaceSpace(str: String) -> String {
        var spaceCount: Int = 0; var newLength: Int ;
        
        for (_, chara) in str.enumerated() {
            if chara == " " {
                spaceCount += 1
            }
        }
        
        let strLength = str.count
        newLength = str.count + spaceCount * 2
    
        var newArray = [Character](repeating: " ", count: newLength)
    
        
        let strArray = Array(str)
        var j = 0
        for i in ((0...strLength-1)) {
            if strArray[i] == " " {
                newArray[j] = "%"
                newArray[j + 1] = "2"
                newArray[j + 2] = "0"
                j = j + 3
            }else {
                newArray[j] = strArray[i];
                j = j + 1
            }
        }
        
        let finalStr = String(newArray)
        
        return finalStr
    }
    
    
    //MARK: -- ComposeString
    
    /*
    "aaabbcdeeeaaawbb" -> "a3b2cde3a3wb2"
     */
    static func composeString(_ str: String) -> String {
        
        guard str.count > 0 else {
            return ""
        }
        var newStr = ""
        var lastCharater : Character? = nil
      
        var sameCount = 1
        for (index, char) in str.enumerated() {

            if char == lastCharater {
                sameCount += 1
                //最后一个
                if index == str.count - 1 {
                    newStr.append("\(sameCount)")
                }
            }else {
                if sameCount > 1 {
                    newStr.append("\(sameCount)")
                }
                newStr.append(char)
                lastCharater = char
                sameCount = 1
            }

        }
        
        return newStr
    }
    
    
    static func setZeros( matrix: inout [[Int]]) {
        var rowZeroArray = [Bool](repeating: false, count: matrix.count)
        var colZeroArray = [Bool](repeating: false, count: matrix.count)
        
        for (i, rowValue) in matrix.enumerated() {
            for (j, value) in rowValue.enumerated() {
                
                if value == 0 {
                    rowZeroArray[i] = true
                    colZeroArray[j] = true
                }
            }
        }
        
        for (i, rowValue) in matrix.enumerated() {
            for (j, _) in rowValue.enumerated() {
                if rowZeroArray[i] || colZeroArray[j] {
                    matrix[i][j] = 0
                }
              
            }
        }
        
    }
    
}
