//
//  ChessPiece.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

protocol ChessPiece {
    var color: ChessColor { get }
    var score: Int { get }
    
    func getMovablePositions(from position: Position) -> [Position]
}
