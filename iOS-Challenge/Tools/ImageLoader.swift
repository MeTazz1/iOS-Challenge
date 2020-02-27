//
//  RemoteImageURL.swift
//  iOS-Challenge
//
//  Created by Chris on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import Combine
import Foundation

// Class ImageLoader - ObservableObject
// tool with a publisher to generate download data from a URL
final class ImageLoader: ObservableObject {
    
    // MARK: - Variables
    // Required method conforming to ObservableObject
    // once data will be downloaded, the observable object will notify this property
    // PassthroughSubject: the Data passed, the failure error>()
    var didChange = PassthroughSubject<Data, Never>()
    
    // the observed data
    // that will call the event when its value changes
    var data = Data() {
        didSet {
            // calling the event
            didChange.send(data)
        }
    }
    
    // MARK: - Body
    // ImageLoader init
    // operating the task of downloading data from URL
    init(urlString:String) {
        
        // Don't even bother trying to download data if there is no valid URL
        guard let url = URL(string: urlString) else { return }
        
        // Initiates the asynchronous task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Asynchronous task done, checking content
            guard let data = data else {
                return
            }
            
            // Changing data on mainThread so the the event is also called on mainThread
            // You want to call the mainThread to rebuild the UI
            DispatchQueue.main.async {
                self.data = data
            }
        }
        // Starting the task
        task.resume()
    }
}
