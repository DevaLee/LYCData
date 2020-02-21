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
    
}
