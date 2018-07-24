//
//  ViewController.swift
//  MovieTracker
//
//  Created by Joel Sene on 24/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import UIKit
import TMDBSwift

class ViewController: UIViewController {

	var test: [Result] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		let apikey = "1f54bd990f1cdfb230adb312546d765d"
		MovieMDB.upcoming(apikey, page: 1, language: "en"){
			data, upcomingMovies in
			if let result = upcomingMovies {
				for r in result {
					let test3 = Result(voteCount: Int(r.vote_count!),
					                   id: r.id,
					                   video: r.video,
					                   voteAverage: r.vote_average,
					                   title: r.title,
					                   popularity: r.popularity,
					                   posterPath: r.poster_path,
					                   originalLanguage: r.original_language,
					                   originalTitle: r.original_title,
					                   genreIDS: r.genre_ids,
					                   backdropPath: r.backdrop_path,
					                   adult: r.adult,
					                   overview: r.overview,
					                   releaseDate: r.release_date)

					self.test.append(test3)
					print(self.test.map{ $0.title })
				}
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
