//
//  MoviesViewController.swift
//  MovieTracker
//
//  Created by Joel Sene on 27/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import UIKit
import TMDBSwift
import Kingfisher

class MoviesViewController: UIViewController {

	//MARK: - OUTLETS
	
	@IBOutlet weak var moviesTableView: UITableView! {
		didSet {
			moviesTableView.delegate = self
			moviesTableView.dataSource = self
			let nib = UINib(nibName: "MoviesTableViewCell", bundle: nil)
			moviesTableView.register(nib, forCellReuseIdentifier: "MoviesTableViewCell")
		}
	}

	var results: [Result] = []
	var selectedMovie: Result!
	let image = UIImage(named: "Placeholder")

	//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Movie Tracker"

		downlodMovieList(pages: pagination)

    }

	override func viewWillAppear(_ animated: Bool) { }

	override func viewDidAppear(_ animated: Bool) { }

	//MARK: - NETWORK
	func downlodMovieList(pages: Int) {
		MovieMDB.upcoming(apiKey, page: pages, language: "en"){
			data, upcomingMovies in
			if let result = upcomingMovies {
				for r in result {
					GenresMDB.genres(apiKey, listType: "movie", language: "en", completion: { apiReturn, genres in
						if let genres = genres{
							genres.forEach{
								var genreId = 0
								var imagePath = ""
								if r.genre_ids?.isEmpty == true {
									genreId = 1
								} else {
									genreId = (r.genre_ids?[0])!
								}

								if r.poster_path?.isEmpty == true {
									imagePath = r.backdrop_path!
								} else {
									imagePath = r.poster_path!
								}

								if genreId == $0.id {

									let movie = Result(voteCount: Int(r.vote_count!),
									                   id: r.id,
									                   video: r.video,
									                   voteAverage: r.vote_average,
									                   title: r.title,
									                   popularity: r.popularity,
									                   posterPath: r.poster_path,
									                   originalLanguage: r.original_language,
									                   originalTitle: r.original_title,
									                   genreIDS: r.genre_ids,
									                   genreName: $0.name!,
									                   backdropPath: r.backdrop_path,
									                   adult: r.adult,
									                   overview: r.overview,
									                   releaseDate: r.release_date,
									                   imageURL: "https://image.tmdb.org/t/p/w500\(String(describing: imagePath))")
									self.results.append(movie)
								}
							}
						}
						DispatchQueue.main.async {
							self.moviesTableView.reloadData()
						}
					})
					DispatchQueue.main.async {
						self.moviesTableView.reloadData()
					}
				}
				DispatchQueue.main.async {
					self.moviesTableView.reloadData()
				}
			}
		}
	}



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detailsVC = segue.destination as? DetailsViewController {
			detailsVC.movie = self.selectedMovie
		}
    }


}

//MARK: - TableView Functions
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return results.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
		if results.isEmpty {
			print("empt")
		} else {
			cell.movieTitle.text = results[indexPath.row].title
			cell.movieGenre.text = results[indexPath.row].genreName
			cell.movieReleaseDate.text = Util.convertDateFormat(from: "yyyy/MM/dd", to: "dd-MM-yyyy", dateString: results[indexPath.row].releaseDate)
			
			//Download Image
			let url = URL(string: results[indexPath.row].imageURL!)
			let processor = RoundCornerImageProcessor(cornerRadius: 5)
			cell.imageView?.kf.indicatorType = .activity

			cell.imageView?.kf.setImage(with: url, placeholder: image, options: [.processor(processor)])
				DispatchQueue.main.async {
				self.moviesTableView.reloadData()
			}
			
		}

		return cell

	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let ipMovie = results[indexPath.row]
		selectedMovie = ipMovie
		performSegue(withIdentifier: "showMovieDetails", sender: nil)
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let lastItem = results.count - 3
		if indexPath.row == lastItem {
			if pagination <= 15 {
				pagination += 1
				print(pagination)
				downlodMovieList(pages: pagination)
			}
		}
	}

}
