//
//  MovieTableViewController.swift
//  SoujanyaMovieapp
//
//  Created by Interview on 9/28/17.
//  Copyright © 2017 Interview. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewController: UITableViewController {
    
    @IBOutlet var viewModel : ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
       //Fetch the data from API call through View Model
        viewModel.getMovies {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source fetching from View Model

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return viewModel.numberOfItemsToShow(in: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)  as! MovieTableViewCell

        // Configure the cell - fetching data from the view model
        movieCell.movieTitle.text = viewModel.movieTitleToShow(for: indexPath)
        movieCell.movieOverview.text = viewModel.movieOverViewToShow(for: indexPath)
        movieCell.movieImage.sd_setImage(with: URL(string:viewModel.movieImageToShow(for: indexPath)), placeholderImage: UIImage(named: "placeholder.png"))
        
        return movieCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = viewModel.getMovieID(for: indexPath){
             self.performSegue(withIdentifier: "movieDetail", sender: id)
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "movieDetail"
        {
            if let movieId = sender {
                let movieDetail = segue.destination as? MovieDetailViewController
                movieDetail?.id = movieId as? String
            }
        }
    }
    

}
