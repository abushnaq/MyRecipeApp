//
//  Recipe.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    // we use the `CodingKeys` enum to translate from JSON key names to names of variables in this struct.
    enum CodingKeys: String, CodingKey {
        case cuisine = "cuisine"
        case name = "name"
        case largePhotoURL = "photo_url_large"
        case smallPhotoURL = "photo_url_small"
        case sourceURL = "source_url"
        case uuid = "uuid"
        case youtubeURL = "youtube_url"
    }
    
    let cuisine : String
    let name : String
    let largePhotoURL : String
    let smallPhotoURL : String
    let sourceURL : URL?
    let uuid : String
    let youtubeURL : URL?
    var id: String { uuid }
}
