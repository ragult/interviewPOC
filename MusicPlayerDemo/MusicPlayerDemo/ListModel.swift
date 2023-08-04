//
//  ListModel.swift
//  MusicPlayerDemo
//
//  Created by Ragul kts on 04/08/23.
//

import SwiftUI


typealias songs = [Song]

struct Song  : Identifiable{
    var title : String
    var albumName : String
    var thumbNail : Image
        var id = UUID()
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let songList = try? JSONDecoder().decode(SongList.self, from: jsonData)

import Foundation

// MARK: - SongList
struct SongList: Codable {
    let status: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let artist, title, album, releaseDate: String
    let label, timecode: String
    let songLink: String
    let appleMusic: AppleMusic

    enum CodingKeys: String, CodingKey {
        case artist, title, album
        case releaseDate = "release_date"
        case label, timecode
        case songLink = "song_link"
        case appleMusic = "apple_music"
    }
}

// MARK: - AppleMusic
struct AppleMusic: Codable {
    let previews: [Preview]
    let artwork: Artwork
    let artistName: String
    let url: String
    let discNumber: Int
    let genreNames: [String]
    let durationInMillis: Int
    let releaseDate, name, isrc, albumName: String
    let playParams: PlayParams
    let trackNumber: Int
    let composerName: String
}

// MARK: - Artwork
struct Artwork: Codable {
    let width, height: Int
    let url, bgColor, textColor1, textColor2: String
    let textColor3, textColor4: String
}

// MARK: - PlayParams
struct PlayParams: Codable {
    let id, kind: String
}

// MARK: - Preview
struct Preview: Codable {
    let url: String
}
