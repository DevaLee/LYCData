//
//  Times.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/11/5.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation
import QuartzCore

public class Times {
    static func useTime<T>(function: (_ element: T) -> (Int), _ argu: T) {
        let start = CACurrentMediaTime()
        print(function(argu))
        let end  = CACurrentMediaTime()
        let time = end - start

        print("time.......\(time)")

    }
}
