//
//  [백준 6443] 애너그램.swift
//  Algorithm
//
//  Created by 김민 on 10/3/24.
//
// 백준 6443 애너그램 https://www.acmicpc.net/problem/6443

/*
[📌 전략]
 문자열 / 백트래킹 / 중복 처리 시 최단 시간 방식 고민하기
 -> 각 알파벳의 아스키값을 인덱스를 기준으로 하는 isUsed 배열을 돌며 백트래킹 실시
 -> 해당 isUsed 배열을 사용하면 정렬을 따로 해줄 필요 없음

[✅ 풀이]
 1. 입력받은 단어들을 순회, 각 단어의 문자도 순회하며 ascii 값 구함
 2. isUsed[ascii-97] 값을 개수만큼 추가
 3. isUsed 추가가 끝나면 백트래킹 실시
 4. 백트래킹 dfs(k, word) / k: 현재 0개의 문자를 뽑음, word는 입력되는 단어
    - k가 word의 개수와 같아지면, 출력할 문자를 전부 다 뽑은 것이므로 출력 후 return
    - isUsed 배열을 순회하며, 0일 때는 continue
    - 0이 아닐 때는 뽑기 위해서 isUsed 값에서 -1을 빼주고, 아스키값을 기반으로 한 소문자 단어를 arr에 추가
    - k+1을 담아 다시 백트래킹 실시
    - 함수가 반환이되엇을 때는, isUsed 값을 +1 하고, arr의 마지막 값을 삭제하여 다시 뽑기에 사용할 수 있도록 함

 [📝 기록]
  처음에 중복 처리를 그냥 set으로 했다가 시간초과가 나서 어려움을 겪었다.
*/

let n = Int(readLine()!)!
var words = [[Character]]()
var isUsed = [Int]()

for _ in 0..<n {
    let line = Array(readLine()!)
    words.append(line)
}

var arr = [Character]()

func dfs(_ k: Int, word: [Character]) {
    if k == word.count {
        print(String(arr))
        return
    }

    for i in 0..<26 {
        if isUsed[i] == 0 { continue }

        isUsed[i] -= 1
        arr.append(Character(UnicodeScalar(i+97)!))
        dfs(k+1, word: word)
        isUsed[i] += 1
        arr.removeLast()
    }
}

for word in words {
    isUsed = Array(repeating: 0, count: 26+3)
    arr = [Character]()

    for w in word {
        isUsed[Int(w.asciiValue!)-97] += 1
    }

    dfs(0, word: word)
}
