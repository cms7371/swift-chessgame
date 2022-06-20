//
//  Queen.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Queen: ChessPiece {
    let color: ChessColor
    
    let score: Int = 9
    
    func getMovablePositions(from position: Position) -> [Position] {
        return []
    }
}
