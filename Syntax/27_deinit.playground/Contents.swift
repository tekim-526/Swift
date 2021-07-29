import UIKit

// Desinitialization
// 해제 

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
    var GameInfo: Game?
    var lastRound = 10
    var roundtime = 20
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game()
var round: Round? = Round()

round?.GameInfo = game
game?.round = round

game = nil
round = nil

// 상호참조를 할 때 nil을 주면 해제가 안됨, 근데 티가 안난다.
