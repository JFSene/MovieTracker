//
//  UIImage.swift
//  MovieTracker
//
//  Created by Joel Sene on 26/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import UIKit

extension UIImageView {
	func dowloadFromServer(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async() {
				self.image = image
			}
			}.resume()
	}
	func dowloadFromServer(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
		guard let url = URL(string: link) else { return }
		dowloadFromServer(url: url, contentMode: mode)
	}
}
