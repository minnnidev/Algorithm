//
//  [백준 3190] 뱀.swift
//  Algorithm
//
//  Created by 김민 on 7/14/24.
//
// 백준 3190 뱀 https://www.acmicpc.net/problem/3190

/*
[📌 전략]
 조건들을 빼먹지 않고 풀이하면 된다.
 문제의 뱀 이동 단계를 따라 구현하면 헷갈리지 않는다.

[✅ 풀이]
 뱀의 이동(뱀의 몸이 존재하는 좌표)은 배열로 관리한다.
 머리를 첫 번째, 꼬리를 마지막 index로 지정했다.
 이를 배경으로 문제에 나온 규칙을 그대로 따른다.
 뱀 배열에 넣을 때는 (x 좌표, y 좌표, 현재 바라보는 방향)으로 넣어줬다.

 1. 몸길이를 늘려 머리를 다음칸에 위치시킨다.
    머리의 현재 바라보는 방향에 따라 snake의 첫 번째 index로 길이를 늘린 좌표를 insert한다.
    moveHead 함수로 구현하였고, 방향에 따라 x, y 좌표를 알맞게 이동해 주면 된다.
 2. 벽이나 자기자신의 몸과 부딪히면 게임이 끝난다.
    늘린 머리가 벽이나 몸에 부딪히는지 확인하고, 부딪혔다면 탈출한다.
 3. 만약 이동한 칸에 사과가 있다면, 그 칸에 있던 사과가 없어지고 꼬리는 움직이지 않는다.
    이동한 칸에 사과가 있다면 사과를 먹었으므로, 사과가 없어졌음을 체크해 줘야 함.
 4. 만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다. 즉, 몸길이는 변하지 않는다.
    몸길이를 줄여주기 위해 뱀 배열의 마지막 요소(꼬리)를 제거해 준다.
 5. 방향을 변경해 줘야 한다면 변경한다.
    입력받은 (시간, 방향) 배열 중 첫 번째 요소를 통해 현재 시간과 입력받은 해당 시간이 같다면,
    방향을 변경해 주었다. 그리고 첫 번째 요소는 제거하여 다음 방향 변경을 대비한다.
 6. 시간을 1초 늘린다.
*/

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n) // 0: empty, 1: apple
var time = 1

for _ in 0..<k {
    let apples = readLine()!.split(separator: " ").map { Int($0)! }
    arr[apples[0]-1][apples[1]-1] = 1
}

let l = Int(readLine()!)!
var dirs = Array(repeating: (0, 0), count: l)

for i in 0..<l {
    let line = readLine()!.split(separator: " ").map { String($0) } // 오: 0, 왼: 1

    dirs[i].0 = Int(line[0])!
    dirs[i].1 = line[1] == "D" ? 0 : 1
}

func moveHead(x: Int, y: Int, dir: Int) -> (Int, Int) {
    switch dir {
    case 0: // 위
        return (x-1, y)
    case 1: // 오
        return (x, y+1)
    case 2: // 아래
        return (x+1, y)
    case 3: // 왼
        return (x, y-1)
    default:
        return (0, 0)
    }
}

func game() {
    var snakes = [(0, 0, 1)] // (x좌표, y좌표, 방향) 위: 0, 오: 1, 아래: 2, 왼: 3

    while true {
        // 원래 방향으로 몸길이 늘림
        let first = snakes[0]
        let movedFirst = moveHead(x: first.0, y: first.1, dir: first.2)
        snakes.insert((movedFirst.0, movedFirst.1, first.2), at: 0)
        
        let (nx, ny) = (movedFirst.0, movedFirst.1)

        // 이동했을 때 벽에 닿거나 몸에 닿으면 게임 끝
        if nx < 0 || nx >= n || ny < 0 || ny >= n { return }

        for i in 1..<snakes.count {
            if snakes[i].0 == nx && snakes[i].1 == ny {
                return
            }
        }

        // 사과가 있으면 넘어가고, 없으면 꼬리 이동
        if arr[nx][ny] == 1 {
            arr[nx][ny] = 0
        } else if arr[nx][ny] == 0 {
            snakes.removeLast()
        }

        // 방향 돌리기
        if !dirs.isEmpty && dirs[0].0 == time {
            let originDir = snakes[0].2
            var newDir = -1
            if dirs[0].1 == 0 { // 오른쪽으로 돌려
                newDir = (originDir+1) % 4
            } else { // 왼쪽으로 돌려
                newDir = (originDir+3) % 4
            }

            snakes[0].2 = newDir
            dirs.removeFirst()
        }

        // 시간 1턴 끝
        time += 1
    }
}

game()
print(time)
