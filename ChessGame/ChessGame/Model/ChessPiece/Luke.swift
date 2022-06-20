//
//  Luke.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Luke: ChessPiece {
    let color: ChessColor
    
    let score: Int = 5
    
    func getMovablePositions(from position: Position) -> [Position] {
        return []
    }
    
    
}
