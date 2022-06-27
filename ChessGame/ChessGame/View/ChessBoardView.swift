//
//  ChessRowGridView.swift
//  ChessGame
//
//  Created by kakao on 2022/06/27.
//

import SwiftUI

struct ChessBoardView: View {
    @EnvironmentObject var gameManager: ChessGameManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<8) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0..<8) { column in
                        ChessCellView(position: ChessPosition(y: row, x: column))
                            .environmentObject(gameManager)
                    }
                }
            }
        }
    }
}

struct ChessRowGridView_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardView()
            .environmentObject(gameManager)
    }
    
    static var gameManager: ChessGameManager {
        let manager = ChessGameManager()
        manager.resetGame()
        return manager
    }
}
