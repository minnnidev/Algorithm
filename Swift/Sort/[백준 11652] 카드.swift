//
//  [백준 11652] 카드.swift
//  Algorithm
//
//  Created by 김민 on 2/10/24.
//
// 백준 11652 카드 https://www.acmicpc.net/problem/11652

/*
[📌 전략]
counting sort의 원리 이용
카드에 적힌 수를 딕셔너리의 Key로 사용하여 등장한 횟수만큼 카운트


[✅ 1번 풀이]
등장 횟수를 카운트한 딕셔너리를
value(등장 횟수)가 같으면, key가 작은 순서대로
이외의 경우에는 등장 횟수가 큰 순서대로 정렬했다.
정렬한 배열의 맨 첫 번째 요소를 출력하여 답 구하기.
*/

// 4611686018427387904개의 배열을 만드는 데 문제가 잇오... 배열은 몇 개 만들 수 있는지 살펴보자
//let n = Int(readLine()!)!
//var nums = [Int: Int]()
//
//for _ in 0..<n {
//    nums[Int(readLine()!)!, default: 0] += 1
//}
//
//var sortedNums = nums.sorted {
//    if $0.value == $1.value {
//        return $0.key < $1.key
//    } else {
//        return $0.value > $1.value
//    }
//}
//
//print(sortedNums[0].key)

/*
[✅ 2번 풀이]
sorted 함수 대신 max의 파라미터에 조건을 정의하여 최대값을 구함.
가장 많이 가지고 있는 정수를 찾고, 가장 많이 가지고 있는 정수가 여러가지일 때, 작은 것이 max가 되어야 하기 때문에
(편의상 첫 번째 요소와 두 번째 요소를 $0, $1로 표현함)
$0과 $1의 value가 같을 때는(가장 많이 가지고 있는 정수가 여러가지일 때) $0.key > $1.key로 중거허눈 순서를 설정해 줘야 가장 작은 key가 max key가 된다.
$0과 $1의 value가 다를 때도 $0.value < $1.value를 반환하여 증가하는 순서를 설정해야 max가 value가 가장 큰 값이 된다.
*/

let n = Int(readLine()!)!
var nums = [Int: Int]()

for _ in 0..<n {
    nums[Int(readLine()!)!, default: 0] += 1
}

print(nums.max {
    if $0.value == $1.value {
        return $0.key > $1.key
    } else {
        return $0.value < $1.value
    }
}!.key)
