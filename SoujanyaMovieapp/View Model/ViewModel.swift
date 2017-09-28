//
//  ViewModel.swift
//  SoujanyaMovieapp
//
//  Created by Interview on 9/28/17.
//  Copyright © 2017 Interview. All rights reserved.
//

import UIKit
import PKHUD

class ViewModel: NSObject {
    
    @IBOutlet var networkManager : NetworkManager!
    
    var movieList : Movie?
    var movieDetail : MovieDetails?
    var movieID : String?
    
    //function to fetch the list of movies
    func getMovies(completion: @escaping () -> Void){
        HUD.show(.progress)
        networkManager.fetchMovieList(completion:{ (movies) in
            DispatchQueue.main.async {
                self.movieList = movies
                HUD.hide()
                completion()
            }
        })
    }
    
    //MARK: - ViewModel functions for Listing the movies
    //Making the functions to source data to View Controllers
    func numberOfItemsToShow(in section : Int) -> Int {
        return movieList?.results?.count ?? 0
    }
    
    func movieTitleToShow(for index: IndexPath) -> String {
        return movieList?.results?[index.row].title ?? ""
    }
    
    func movieOverViewToShow(for index: IndexPath) -> String {
        return movieList?.results?[index.row].overview ?? ""
    }
    
    func movieImageToShow(for index: IndexPath) -> String {
        if let imgPath = movieList?.results?[index.row].poster_path{
            return "\(AppConstants.kMovieImgUrl)w500\(imgPath)"
        }
        return ""
    }
    
    func getMovieID(for index: IndexPath) -> String? {
        if let id = movieList?.results?[index.row].movieId{
            return String(describing:id)
        }
        return ""
    }
    
    
    
    //MARK: - ViewModel functions for Listing the movies
    //Making the functions to source data to View Controllers
    
    //Fetch a particlar movie detail
    func getMovieDetails(_movieId : String?, completion: @escaping () -> Void){
        HUD.show(.progress)
        networkManager.fetchMovieDetail(_movieID: _movieId , completion:{ (movieDetail) in
            DispatchQueue.main.async {
                self.movieDetail = movieDetail
                HUD.hide()
                completion()
            }
        })
    }
    
    func getMovieTitle() -> String {
        return movieDetail?.title ?? ""
    }
    
    func getMovieOriginalTitle() -> String {
        return movieDetail?.originalTitle ?? ""
    }
    
    func getMovieDuration() -> String {
        if let duration = movieDetail?.runtime{
            return "\(duration) mins"
        }
        return ""
    }
    
    func getMovieGenre() ->String {
        //let arrGenre = movieDetail?.genres.map({$0.name})
        return "" // (movieDetail?.genres)!
    }
    
    func getMovieOverViewToShow() -> String {
        return movieDetail?.overview ?? ""
    }
    
    func getVoteAvg() -> Double {
        return movieDetail?.vote_average ?? 0.0
    }
    
    func getVoteCount() -> Double {
        return movieDetail?.vote_count ?? 0.0
    }
    
    func movieBgImg() -> String {
        if let imgPath = movieDetail?.backdrop_path{
            return "\(AppConstants.kMovieImgUrl)w500\(imgPath)"
        }
        return ""
    }
    
    func movieDetailPoster() -> String {
        if let imgPath = movieDetail?.poster_path{
            return "\(AppConstants.kMovieImgUrl)w500\(imgPath)"
        }
        return ""
    }
    
}
