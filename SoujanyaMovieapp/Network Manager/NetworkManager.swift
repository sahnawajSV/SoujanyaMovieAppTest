//
//  NetworkManager.swift
//  SoujanyaMovieapp
//
//  Created by Interview on 9/28/17.
//  Copyright © 2017 Interview. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class NetworkManager: NSObject {
    //function to fetch the movies
    func fetchMovieList(completion : @escaping (Movie?) -> Void){
        Alamofire.request(AppConstants.kAppUrl).responseObject { (response: DataResponse<Movie>) in
            
            if response.result.isSuccess {
                if let resJson = response.result.value{
                completion(resJson)
            }
            }
            if response.result.isFailure {
               // let error : Error = response.result.error!
                completion(nil)
            }
        }
    }
    
    //function to fetch the movies by passing movie ids
    func fetchMovieDetail(_movieID : String? ,completion : @escaping (MovieDetails?) -> Void){
        Alamofire.request(AppConstants.kBaseUrl+_movieID!+AppConstants.kMovieDetailUrlApiKey).responseObject {  (response: DataResponse<MovieDetails>) in
            
            
            if response.result.isSuccess {
                if let resJson = response.result.value{
                    completion(resJson)
                }
            }
            if response.result.isFailure {
                //let error : Error = response.result.error!
                completion(nil)
            }
        }
    }
}
