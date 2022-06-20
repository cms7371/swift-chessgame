//
//  Pawn.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Pawn: ChessPiece {
    let color: ChessColor
    
    let score: Int = 1
    
    func getMovablePositions(from position: Position) -> [Position] {
        return []
    }
}
