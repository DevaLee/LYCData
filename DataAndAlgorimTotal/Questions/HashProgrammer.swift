//
//  OrientObjectProgrammer.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/3/28.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation


/*:
 ![Playground icon](#imageLiteral(resourceName: "屏幕快照 2020-03-28 下午10.45.16.png"))
 */


public class Cell<K: StringProtocol,V> {


    var key: K

    var value: V

    init(k: K, v: V) {
        key = k
        value = v
    }

    func equivalentTo(c: Cell<K, V>) -> Bool {
        return equivalentTo(k: c.getKey())
    }

    func equivalentTo(k: K) -> Bool {

        return key == k
    }


    func getKey() -> K {

        return key
    }

    func getValue() -> V {

        return value
    }
}




class LYHash<K:StringProtocol, V> {

    let MAX_SIZE = 10
    var items : [LinkedList<Cell<K, V>>?] = [LinkedList<Cell<K, V>>?]()

    func Hash() {
        items = Array.init(repeating: nil, count: MAX_SIZE)
    }


    // 非常糟糕的hash算法：将key的长度 和 数组长度的余数作为 hash值
    func hashCodeOfKey(_ key: K)  -> Int{

        return key.count % items.count
    }

    func put(_ key: K, value: V) {
        let x = hashCodeOfKey(key)

        if items[x] == nil {
            items[x] = LinkedList<Cell<K, V>>()
        }


        var collided = items[x]!

        for c in collided {
            //发现冲突
            if c.equivalentTo(k: key) {

                // 删除冲突的那个
                //collided.remove(after: c)
                break
            }
        }

        let cell = Cell<K, V>(k: key, v: value)

        collided.append(cell)
    }



    func get(_ key: K) -> V? {
        // 算出key的hash值
        let x = hashCodeOfKey(key)

        if items[x] == nil {
            return nil
        }


        let collided = items[x]!

        for c in collided {
            if c.equivalentTo(k: key) {
                return c.getValue()
            }
        }

        return nil
    }


}
