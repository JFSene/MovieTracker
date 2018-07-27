//
//  MoviesTableViewCell.swift
//  MovieTracker
//
//  Created by Joel Sene on 27/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

	@IBOutlet weak var posterImage: UIImageView! 
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieGenre: UILabel!
	@IBOutlet weak var movieReleaseDate: UILabel!
	var iamgeDownloadPath:String?

    override func awakeFromNib() {

	}
}
