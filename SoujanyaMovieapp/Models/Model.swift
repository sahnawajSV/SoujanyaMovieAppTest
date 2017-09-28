//
//  Model.swift
//  SoujanyaMovieapp
//
//  Created by Interview on 9/28/17.
//  Copyright © 2017 Interview. All rights reserved.
//

import UIKit
import ObjectMapper

class Movie: Mappable {
    var page: Int?
    var total_results: Double?
    var total_pages : Double?
    var results: [MovieList]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        page    <- map["page"]
        total_results   <- map["total_results"]
        total_pages   <- map["total_pages"]
        results       <- map["results"]
        
    }
}

struct MovieList: Mappable {
    var poster_path: String?
    var overview: String?
    var title: String?
    var movieId: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        poster_path 	<- map["poster_path"]
        overview 	<- map["overview"]
        title 	<- map["title"]
        movieId    <- map["id"]
    }
}

class MovieDetails: Mappable {
    var backdrop_path: String?
    var title: String?
    var vote_average: Double!
    var genres: [Genre]?
    var poster_path: String?
    var overview: String?
    var id: String?
    var release_date: Date?
    var tagline: String?                      
    var runtime: Double?
    var homepage: Double?
    var originalTitle: String?
    var vote_count: Double!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        backdrop_path    <- map["backdrop_path"]
        title         <- map["title"]
        vote_average      <- map["vote_average"]
        genres       <- map["genres"]
        poster_path  <- map["poster_path"]
        overview     <- map["overview"]
        id    <- map["id"]
        release_date    <- (map["release_date"], DateTransform())
        tagline     <- map["tagline"]
        runtime    <- map["runtime"]
        homepage    <- map["homepage"]
         originalTitle    <- map["original_title"]
         vote_count      <- map["vote_count"]
    }
}

struct Genre: Mappable {
    var id: String?
    var name: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id 	<- map["id"]
        name 	<- map["name"]
        
    }
}
