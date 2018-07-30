//
//  DetailsViewController.swift
//  MovieTracker
//
//  Created by Joel Sene on 27/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
	//MARK: - OUTLETS
	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var genre: UILabel!
	@IBOutlet weak var releaseDate: UILabel!
	@IBOutlet weak var overView: UITextView!
	@IBOutlet weak var containerView: UIView! {
		didSet {
			containerView.layer.cornerRadius = 3
		}
	}

	var movie: Result!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let url = URL(string: movie.imageURL!)
		posterImage.kf.setImage(with: url)
		posterImage.contentMode = .scaleAspectFit
		genre.text = movie.genreName
		releaseDate.text = Util.convertDateFormat(from: "yyyy-MM-dd", to: "dd - MM - yyyy", dateString: movie.releaseDate)
		overView.text = movie.overview
		movieTitle.text = movie.title

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	@IBAction func closeButtonTapped(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}

}
