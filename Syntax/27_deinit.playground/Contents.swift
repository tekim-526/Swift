import UIKit

// Desinitialization
// 해제 메모리가 해제 될때 발동되는 부분이다

var a: Int? = 10

a = nil

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init() {
        print("game init")
    }
    deinit {
        print("game deinit")
    }
}

class Round {
    weak var GameInfo: Game? // 원본(Game)이 사라지면 gameInfo도 사라진다는 의미
    var lastRound = 10
    var roundtime = 20
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game()
var round: Round? = Round()
 
game?.round = round
round?.GameInfo = game

game = nil
round = nil

// 상호참조를 할 때 nil을 주면 해제가 안됨, 근데 티가 안난다.
// 상호참조하는 모든 것에다가 nil을 주어야 메모리에서 해제된다
