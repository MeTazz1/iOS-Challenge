//
//  ImageViewDefault.swift
//  iOS-Challenge
//
//  Created by Christophe Dlc on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

// Struct ImageViewRowDefault - View
// default image for content type != image on HomeRow
struct ImageViewDefault: View {
    
    // MARK: - Variables
    // CGSize desiredSize
    // used in the body for the Image's frame size
    var desiredSize: CGSize
    
    // MARK: - Body
    var body: some View {
        // Creating an Image with local resource
        // allowing resizes
        Image("turtlerock")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: desiredSize.width, height: desiredSize.height)
            .shadow(radius: 2)
    } // View
}

struct ImageViewRowDefault_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewDefault(desiredSize: CGSize(width: 320, height: 320))
    }
}
