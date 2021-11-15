import UIKit

// Class - inheritance
// 상속

class GameInfo {
    var homeScore = 0
    var awayScore = 0
    
    func presentScore() -> String// final을 적으면 다른데서 오버라이드 불가능
    {
        return homeScore.description + " : " + awayScore.description
    }
}

class Soccer: GameInfo { // 콜론찍고 부모 class를 가져옴
    var time = 0
}
class Baseball: GameInfo {
    final override func presentScore() -> String {
        return homeScore.description + " 대 " + awayScore.description
    }
    var round = 0
}

class Football: GameInfo {
}

let soccer = Soccer()
soccer.homeScore = 40
soccer.awayScore = 20
soccer.time = 45
soccer.presentScore()

let baseball = Baseball()
baseball.homeScore = 20
baseball.round = 9
baseball.presentScore()

let football = Football()
football.awayScore = 30
football.presentScore()
