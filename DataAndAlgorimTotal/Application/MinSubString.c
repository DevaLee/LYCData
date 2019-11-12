//
//  MinSubString.c
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/11/11.
//  Copyright © 2019 liyuchen. All rights reserved.
//

#include "MinSubString.h"


int strLength(char *p) {
    
    int number = 0;
    while (*p) {
        number ++;
        p++;
    }
    return number;
}


int unRepeatStr(char *a, int start, int end) {
    for (int i = start; i < end; i++) {
        char c = a[i];
        for (int j = i + 1; j < end; j++) {
            if (c == a[j]) {
                return 0;
            }
        }
    }
    return  1;
}

int lengthLongestSubString(char *a){
    int n = strLength(a);
    int ans = 0;
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (unRepeatStr(a, i, j)) {
                ans = (ans > j - i) ? ans: j - i;
            }
        }
    }
    return ans;
}



