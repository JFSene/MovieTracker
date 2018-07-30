/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import UIKit
import Kingfisher

class Movie {
	let results: [Result]?
	let page: Int?
	let totalResults: Int?
	let dates: Dates?
	let totalPages: Int?

	init(results: [Result]?, page: Int?, totalResults: Int?, dates: Dates?, totalPages: Int?) {
		self.results = results
		self.page = page
		self.totalResults = totalResults
		self.dates = dates
		self.totalPages = totalPages
	}
}

class Dates {
	let maximum: String?
	let minimum: String?

	init(maximum: String?, minimum: String?) {
		self.maximum = maximum
		self.minimum = minimum
	}
}

class Result {
	let voteCount: Int?
	let id: Int?
	let video: Bool?
	let voteAverage: Double?
	let title: String?
	let popularity: Double?
	let posterPath: String?
	let originalLanguage: String?
	let originalTitle: String?
	let genreIDS: [Int]?
	let genreName: String?
	let backdropPath: String?
	let adult: Bool?
	let overview: String?
	let releaseDate: String?
	let imageURL: String?

	init(voteCount: Int?, id: Int?, video: Bool?, voteAverage: Double?, title: String?, popularity: Double?, posterPath: String?, originalLanguage: String?, originalTitle: String?, genreIDS: [Int]?, genreName: String, backdropPath: String?, adult: Bool?, overview: String?, releaseDate: String?, imageURL: String?) {
		self.voteCount = voteCount
		self.id = id
		self.video = video
		self.voteAverage = voteAverage
		self.title = title
		self.popularity = popularity
		self.posterPath = posterPath
		self.originalLanguage = originalLanguage
		self.originalTitle = originalTitle
		self.genreIDS = genreIDS
		self.genreName = genreName
		self.backdropPath = backdropPath
		self.adult = adult
		self.overview = overview
		self.releaseDate = releaseDate
		self.imageURL = imageURL
	}
}
