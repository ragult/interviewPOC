//
//  ContentView.swift
//  MusicPlayerDemo
//
//  Created by Ragul kts on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var songList = SongList()
    var body: some View {
//        if listViewModel.fetchSongs() > 0 {
            NavigationStack{
//                List(listViewModel.fetchSongs()) {song in
                    HStack{
                        song.thumbNail
                        Text(listViewModel.fetchSongs()[0].albumName)
                    }
//                }
            }.onAppear(perform: {
                Task{
                    do {
                        songList =   await listViewModel.fetchSongs()
                        
                    }
                }
            })
//        } else {
//            EmptyView()
//        }
        

        
//        List(selection: listViewModel.fetchSongs().songs?.count) {
//            Image(listViewModel.)
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
