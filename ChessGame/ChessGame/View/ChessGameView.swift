//
//  ChessGameView.swift
//  ChessGame
//
//  Created by kakao on 2022/06/27.
//

import SwiftUI

struct ChessGameView: View {
    @EnvironmentObject var gameManager: ChessGameManager
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Spacer()
                Text("Black Score\n\(gameManager.blackScore)")
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Turn\n\(gameManager.turn.rawValue)")
                    .multilineTextAlignment(.center)
                Spacer()
                Text("White Score\n\(gameManager.whiteScore)")
                    .multilineTextAlignment(.center)
                Spacer()
            }
            ChessBoardView()
                .environmentObject(gameManager)
            Button {
                gameManager.resetGame()
            } label: {
                Text("Restart Game")
            }
        }
    }
}

struct ChessGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChessGameView().environmentObject(gameManager)
    }
    
    static var gameManager: ChessGameManager {
        let manager = ChessGameManager()
        manager.resetGame()
        return manager
    }
}
