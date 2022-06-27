//
//  GameManager.swift
//  ChessGame
//
//  Created by kakao on 2022/06/22.
//

import Foundation
import SwiftUI
import Combine

class ChessGameManager: ObservableObject {
    var board = ChessGameBoard()
    
    @Published var turn: ChessColor = .black
    @Published var whiteScore: Int = 0
    @Published var blackScore: Int = 0
    @Published var selectedPosition: ChessPosition?
    @Published var movablePositions: [ChessPosition]?
    
    var disposeBag: Set<AnyCancellable> = []
    
    init() {
        board.objectWillChange
            .sink { self.objectWillChange.send() }
            .store(in: &disposeBag)
    }
    
    func resetGame() {
        board.reset()
        turn = .black
        whiteScore = 0
        blackScore = 0
        selectedPosition = nil
        movablePositions = nil
    }
    
    func select(position: ChessPosition) {
        if let selectedPosition = selectedPosition {
            guard position != selectedPosition else {
                self.selectedPosition = nil
                self.movablePositions = nil
                return
            }
            
            let targetPiece = board.pieces[position]
            let score = targetPiece?.score ?? 0
            
            guard board.move(from: selectedPosition, to: position) else {
                print("Can't move to that position")
                return
            }
            
            switch turn {
            case .white:
                whiteScore += score
                turn = .black
            case .black:
                blackScore += score
                turn = .white
            }
            
            self.selectedPosition = nil
            self.movablePositions = nil
        } else {
            guard let selectedPiece = board.pieces[position], selectedPiece.color == turn else {
                print("Select valid position or colored piece")
                return
            }
            
            self.selectedPosition = position
            self.movablePositions = selectedPiece.getMovablePositions(on: position, from: board.pieces)
        }
    }
}
