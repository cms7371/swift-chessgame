//
//  ContentView.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ChessGameView().environmentObject(ChessGameManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
