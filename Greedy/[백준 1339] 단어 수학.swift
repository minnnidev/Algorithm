//
//  [백준 1339] 단어 수학.swift
//  Algorithm
//
//  Created by 김민 on 6/27/24.
//
// 백준 1339 단어 수학 https://www.acmicpc.net/problem/1339

/*
[✅ 풀이]
 전체적인 풀이 아이디어는 입력을 받을 때 알파벳의 각 자릿수만큼을 미리 더한 뒤, 가장 큰 값부터 9로 취급하는 것. ex. 예제2에서 A는 10000, C는 1010이 된다.

 1. 입력받을 때 자릿수만큼을 계산하기 쉽게 reverse로 입력받은 후 거듭 제곱으로 자릿수만큼을 계산
 2. 딕셔너리에 넣어준 뒤 내림차순으로 정렬
 3. 9부터 차례차례 넣어 계산

[📝 기록]
 큰 자릿수에 있을수록 숫자가 커야 하고, 같은 자리이면 뒤에 더 큰 자릿수가 나오는 게 무조건 클 것이다. 라고 접근했는데 AB / BB 일 때 당차게 틀려버렸다. 💦 재밌는 문제였다. 맞혔으면 더 재밌었을 텐데... ㅎ

*/

import Foundation

let n = Int(readLine()!)!
var alphaDic = [String: Int]()

for _ in 0..<n {
    let word = String(readLine()!.reversed()).map { String($0) }

    for (idx, w) in word.enumerated() {
        alphaDic[w, default: 0] += Int(pow(10.0, Float(idx)))
    }
}

let sortedDic = alphaDic.sorted { $0.value > $1.value }

var ans = 0

for (idx, dic) in sortedDic.enumerated() {
    ans += (9-idx) * dic.value
}

print(ans)


//import Foundation
//
//let n = Int(readLine()!)!
//var words = [[String]]()
//var pos = [String: [Int]]() // ABCDEFGHIJ
//
//for _ in 0..<n {
//    let word = String(readLine()!.reversed()).map { String($0) }
//
//    for i in 0..<word.count {
//        pos[word[i], default: []].append(i+1)
//    }
//
//    words.append(word)
//}
//
//for (key, value) in pos {
//    pos[key] = value.sorted(by: >)
//}
//
//let sortedPos = pos.sorted {
//    for i in 0..<min($0.value.count, $1.value.count) {
//        if $0.value[i] > $1.value[i] { return true }
//    }
//    return false
//}
//
//var alphaDic = [String: Int]()
//for (index, p) in sortedPos.enumerated() {
//    alphaDic[p.key, default: 0] += (9-index)
//}
//
//var ans = 0
//for word in words {
//    for (idx, w) in word.enumerated() {
//        ans += Int(pow(10.0, Float(idx))) * alphaDic[w]!
//    }
//}
//
//print(ans)
