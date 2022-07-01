//: Playground - noun: a place where people can play

import UIKit


protocol TurnBasedGame{
    
    var turn: Int{get set}
    
    func play()
}

@objc protocol TurnBasedGameDelegate{
    
    func gameStart()
    func playerMove()
    func gameEnd()
    
    //optional func turnStart()         //swift 2
    @objc optional func turnStart()     //swift 3
    //optional func turnEnd()           //swift 2
    @objc optional func turnEnd()       //swift 3
    
    func gameOver() -> Bool
}

class SinglePlayerTurnBasedGame: NSObject, TurnBasedGame{
    
    var turn = 0
    var delegate:TurnBasedGameDelegate!
    
    func play(){
        
        delegate.gameStart()
        while !delegate.gameOver(){
            
            if let turnStart = delegate.turnStart{
                turnStart()
            }
            else{
                print("ROUND",turn,":")
            }
            
            delegate.playerMove()
            
            delegate.turnEnd?()
            
            turn += 1
        }
        delegate.gameEnd()
    }
}


class RockPaperScissors: SinglePlayerTurnBasedGame, TurnBasedGameDelegate{
    
    enum Shape: Int{
        case Rock
        case Scissors
        case Papper
        
        func beat(shape: Shape) -> Bool{
            return (self.rawValue + 1)%3 == shape.rawValue
        }
    }
    
    var wins = 0
    var otherWins = 0
    
    override init() {
        super.init()
        delegate = self
    }
    
    static func go() -> Shape{
        return Shape(rawValue: Int(arc4random())%3)!
    }
    
    func show( hand: Shape) -> String{
        
        switch(hand){
        case .Papper:   return "Paper"
        case .Rock:     return "Rock"
        case .Scissors: return "Scissors"
        }
    }
    
    func gameStart() {
        wins = 0
        otherWins = 0
        print("== Rock Paper Scissor ==")
    }
    
    func gameOver() -> Bool {
        return wins >= 2 || otherWins >= 2
    }
    
    func gameEnd() {
        if( wins >= 2 ){
            print("You win!")
        }
        else{
            assert( otherWins >= 2 , "game end with wins < 2 && otherWins < 2" )
            print("You lose...")
        }
    }
    
    func playerMove() {
        
        let yourShape = RockPaperScissors.go()
        let otherShape = RockPaperScissors.go()
        //print("Your:",show(yourShape))              //swift 2
        print("Other:",show(hand: otherShape))        //swift 3
        
        //if yourShape.beat(otherShape){                    //swift 2
        if yourShape.beat(shape: otherShape){               //swift 3
            print("You win this round")
            wins += 1
        }
        //else if otherShape.beat(yourShape){               //swift 2
        else if otherShape.beat(shape: yourShape){          //swift 3
            print("You lose this round")
            otherWins += 1
        }
        else if yourShape == otherShape{
            print("Tie in this round")
        }
        else{
            assertionFailure("Impossible Shapes")
        }
    }
    
    func turnStart() {
        print("== ROUND START ==")
    }
    
    func turnEnd() {
        print("=================")
    }
}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.play()
