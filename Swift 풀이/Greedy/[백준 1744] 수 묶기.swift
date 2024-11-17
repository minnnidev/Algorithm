//
//  [백준 1744] 수 묶기.swift
//  Algorithm
//
//  Created by 김민 on 12/18/23.
//
// 백준 1744 수 묶기 https://www.acmicpc.net/problem/1744

/*
수의 범위는 -1000~1000이다. 즉, 음수와 0도 고려해야 한다.
수들의 합이 최대가 하기 위해서는 가장 큰 -끼리, 가장 큰 +끼리 곱해야 한다고 생각했다.
따라서 음수, 0으로 이루어진 수열, 양수로 이루어진 수열로 구분한다.
음수, 0인 수열은 작은 순서대로 정렬하여 앞에서부터 2개씩 짝지어서 곱한다.
양수 수열은 큰 순서대로 정렬하여 앞에서부터 2개씩 짝지어서 곱한다.
양수 수열에서 짝지어 곱하는 경우, 하나가 1일 경우 곱하는 것보다 더하는 것이 합이 최대가 되므로 더해준다.
이때 주의할 점은 2개씩 짝지어 곱해주기 위해서, 각 수열의 개수가 짝수가 아닐 때는 정렬한 배열의 마지막 요소를 remains 배열에 저장한다.
remains배열은 최대 2개로 이루어지는데, 이때 [음수(0포함)], [양수], [음수(0 포함), 양수 조합]이 된다.
마지막 케이스에서 두 요소를 곱하는 것보다, 더하는 것이 합이 최대가 되므로 더해준다.
*/

let N = Int(readLine()!)!
var positives = [Int]()
var negatives = [Int]()
var remains = [Int]()

// 음수와 양수로 따로 입력받는다
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input > 0 {
        positives.append(input)
    } else {
        negatives.append(input)
    }
}

func combinateNumbers(_ arr: inout [Int]) -> Int {
    var result = 0
    if arr.count % 2 != 0 { // 배열의 개수가 홀수인 경우 마지막 하나를 remains 배열에 저장
        remains.append(arr.removeLast())
    }

    for index in stride(from: 0, to: arr.count-1, by: 2) { //stride를 사용하여 2개씩 건너뛰며 계산해줌
        let (first, second) = (arr[index], arr[index+1])
        if first == 1 || second == 1 { // 하나가 1일 경우는 곱해주기보다 더해주기
            result += (first + second)
        } else {
            result += (first * second)
        }
    }
    
    return result
}

negatives.sort() // 내림차순 정렬
positives.sort(by: >) // 오름차순 정렬
print(combinateNumbers(&negatives) + combinateNumbers(&positives) + remains.reduce(0, +))
