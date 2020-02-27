//
//  ImageView.swift
//  iOS-Challenge
//
//  Created by Chris on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI
import Combine

// Struct ImageView - View
// ImageViewComponent with desired size
struct ImageView: View {
    
    // MARK: - Variables
    // ImageLoader imageLoader: tool to generate download data from a URL
    // ObservedObject: once data will be downloaded, the observable object will notify this property
    @ObservedObject var imageLoader:ImageLoader
    
    // UIImage image
    // State variable stores its state and invalidates UI everytime its value changes
    @State var image: UIImage = UIImage(named: "turtlerock")!
    
    // CGSize desiredSize
    // used in the body for the Image's frame size
    var desiredSize: CGSize
    
    // MARK: - Body
    // ImageViewRow initializer
    // has to load every struct property before returning self
    init(url:String, desiredSize: CGSize) {
        // initiates the process of downloading image data from URL
        imageLoader = ImageLoader(urlString:url)
        self.desiredSize = desiredSize
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: desiredSize.width, height: desiredSize.height)
                .shadow(radius: 2)
        } // VStack
            
            // onReceive callback will perform an action everytime its publisher (imageLoader.didChange) emits an event
            .onReceive(imageLoader.didChange) { data in
                // update self.image with the retrieved data from URL
                // if image fails to generate, we generate an UIImage from local resource
                self.image = UIImage(data: data) ?? self.image
        }
    } // View
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://placeimg.com/620/320/any", desiredSize: CGSize(width: 300, height: 300))
    }
}
