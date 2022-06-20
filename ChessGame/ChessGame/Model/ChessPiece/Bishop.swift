//
//  Bishop.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Bishop: ChessPiece {
    let color: ChessColor
    
    let score: Int = 3
    
    func getMovablePositions(from position: Position) -> [Position] {
        return []
    }
    
    
}
