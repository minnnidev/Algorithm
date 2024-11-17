//
//  [백준 18870] 좌표 압축.swift
//  Algorithm
//
//  Created by 김민 on 3/4/24.
//
// 백준 18870 좌표 압축 https://www.acmicpc.net/problem/18870

/*
[✅ 1번 풀이]
 이분탐색을 사용하여 특정 데이터가 처음으로 등장하는 인덱스를 구해보자.
 중복을 제거하고 정렬한 뒤 이분 탐색을 실시한 뒤 처음으로 등장하는 순서를 구하게 되면
 이전에 Xi > Xj를 만족하는 서로 다른 좌표 Xj의 개수와 일치하게 된다.

 st, en, mid 인덱스를 두고 이분 탐색을 한다.
 정렬된 배열의 mid 값이 taget과 크거나 같다면 en을 mid로 이동하여 다시 이분 탐색 실시
 mid 값이 target보다 작다면 st를 1칸 오른쪽으로 이동시켜 이분 탐색 실시
 이를 반복하여 해당 수가 처음 등장하는 인덱스를 구한다.
*/

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var sAarr = Set(arr).sorted()

func lowerIdx(_ target: Int) -> Int {
    var st = 0
    var en = sAarr.count-1

    while st < en {
        let mid = (st+en)/2
        if sAarr[mid] >= target { en = mid }
        else { st = mid + 1 }
    }
    return st
}

var result = ""
arr.forEach { result += "\(lowerIdx($0)) " }
print(result)

/*
 [✅ 2번 풀이 풀이]
 입력받은 배열을 중복 제거 후 오름차순으로 정렬
 딕셔너리로 정렬된 배열의 인덱스를 받아
 알맞은 인덱스를 출력하면 인덱스가 0으로 시작하는 성질 때문에 바로 좌표 압축을 적용한 결과를 출력할 수 있다.
 */
//let n = Int(readLine()!)!
//var arr = readLine()!.split(separator: " ").map { Int($0)! }
//var sArr = Set(arr).sorted()
//var orders = [Int: Int]()
//var idx = 0
//
//for num in sArr {
//    if orders[num] == nil {
//        orders[num] = idx
//        idx += 1
//    }
//}
//
//print(arr.map { "\(orders[$0]!)" }.joined(separator: " "))
