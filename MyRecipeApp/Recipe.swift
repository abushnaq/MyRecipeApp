//
//  Recipe.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case cuisine = "cuisine"
        case name = "name"
        case largePhotoURL = "photo_url_large"
        case smallPhotoURL = "photo_url_small"
        case sourceURL = "source_url"
        case uuid = "uuid"
        case youtubeURL = "youtube_url"
    }
    
    var cuisine : String
    var name : String
    var largePhotoURL : String
    var smallPhotoURL : String
    var sourceURL : URL?
    var uuid : String
    var youtubeURL : URL?
    var id: String { uuid }
//    "cuisine": "Polish",
//                "name": "Rogaliki (Polish Croissant Cookies)",
//                "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/15d50359-5f62-4583-a9e9-d761bc58fecf/large.jpg",
//                "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/15d50359-5f62-4583-a9e9-d761bc58fecf/small.jpg",
//                "source_url": "https://www.food.com/recipe/rogaliki-polish-croissant-cookies-with-jam-filling-200668",
//                "uuid": "e084dc2c-37e7-4600-9b46-76e673e8e2d2",
//                "youtube_url": "https://www.youtube.com/watch?v=VAR10T9mfhU"
}
