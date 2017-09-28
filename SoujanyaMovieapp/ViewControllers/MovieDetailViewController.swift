//
//  MovieDetailViewController.swift
//  SoujanyaMovieapp
//
//  Created by Interview on 9/28/17.
//  Copyright © 2017 Interview. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieBgImg: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieOriginalTitleLbl: UILabel!
    @IBOutlet weak var movieDurationLbl: UILabel!
    @IBOutlet weak var movieGenreLbl: UILabel!
    @IBOutlet weak var moviePosterImg: UIImageView!
    @IBOutlet weak var movieOverviewLbl: UILabel!
    @IBOutlet weak var ratingsLbl: UILabel!
    @IBOutlet weak var RateThisLbl: UILabel!
    @IBOutlet weak var criticRatingBtn: UIButton!
    
    @IBOutlet weak var criticReviewLbl: UILabel!
    @IBOutlet var viewModel : ViewModel!
    var id : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieDetails(_movieId: id)  {
            self.loadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        //self.criticRatingBtn.titleLabel?.text = String(describing: viewModel.getVoteCount())
        self.criticRatingBtn.setTitle(String(describing: viewModel.getVoteCount()), for: .normal)
        self.ratingsLbl.text = String(describing: viewModel.getVoteAvg())
        self.movieTitleLbl.text = String(describing: viewModel.getMovieTitle())
        self.movieOriginalTitleLbl.text = String(describing: viewModel.getMovieOriginalTitle())
        self.movieDurationLbl.text = String(describing: viewModel.getMovieDuration())
        self.movieGenreLbl.text = String(describing: viewModel.getMovieGenre())
        self.movieOverviewLbl.text = String(describing: viewModel.getMovieOverViewToShow())
        self.ratingsLbl.text = String(describing: viewModel.getVoteAvg())
        self.movieBgImg.sd_setImage(with: URL(string:viewModel.movieBgImg()), placeholderImage: UIImage(named: "placeholder.png"))
        self.moviePosterImg.sd_setImage(with: URL(string:viewModel.movieDetailPoster()), placeholderImage: UIImage(named: "placeholder.png"))
    }

}
