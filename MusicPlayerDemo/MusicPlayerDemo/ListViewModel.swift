//
//  ListViewModel.swift
//  MusicPlayerDemo
//
//  Created by Ragul kts on 04/08/23.
//

import SwiftUI

class ListViewModel : NSObject, ObservableObject{
    var niceSong = Song(title: "Nice Song", albumName: "Nice Song Album", thumbNail: Image(systemName: "eraser"))
    func fetchSongs() async throws -> SongList{
        var songList : [SongList] = []
       
        let parameters = [
          [
            "key": "url",
            "value": "https://audd.tech/example.mp3",
            "type": "text"
          ],
          [
            "key": "return",
            "value": "apple_music",
            "type": "text"
          ],
          [
            "key": "api_token",
            "value": "test",
            "type": "text"
          ]] as [[String: Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
          if param["disabled"] != nil { continue }
          let paramName = param["key"]!
          body += "--\(boundary)\r\n"
          body += "Content-Disposition:form-data; name=\"\(paramName)\""
          if param["contentType"] != nil {
            body += "\r\nContent-Type: \(param["contentType"] as! String)"
          }
          let paramType = param["type"] as! String
          if paramType == "text" {
            let paramValue = param["value"] as! String
            body += "\r\n\r\n\(paramValue)\r\n"
          } else {
            let paramSrc = param["src"] as! String
            let fileData = try? NSData(contentsOfFile: paramSrc, options: []) as Data
            let fileContent = String(data: fileData!, encoding: .utf8)!
            body += "; filename=\"\(paramSrc)\"\r\n"
              + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.audd.io/")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let (data, response) = try await URLSession.shared.data(for: request)

          var songsFetched = try! JSONDecoder().decode(SongList.self, from: data)
        print(String(data: data, encoding: .utf8)!)
          return songsFetched
    
    }
    
    func fetchSongDetails(songID : UUID) -> Song {
        return niceSong
    }
}
