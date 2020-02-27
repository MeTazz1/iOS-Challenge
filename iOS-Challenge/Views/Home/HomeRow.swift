//
//  HomeRow.swift
//  iOS-Challenge
//
//  Created by Chris on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

// Struct HomeRow - View
// row model for HomeView's rows
struct HomeRow: View {
    
    // MARK: - Variables
    // ContentData contentDataRow: 
    // one element of the content
    var contentDataRow : ContentData
    
    // MARK: - Body  
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                // if element is an image and the data field isn't empty
                if self.contentDataRow.type == .image  && self.contentDataRow.data != nil {
                    // generate an image from URL contained in .data, with the desired Size
                    ImageView(url: contentDataRow.data!, desiredSize: CGSize(width: 60, height: 60))
                }
                else {
                    // generate a default image
                    ImageViewDefault(desiredSize: CGSize(width: 60, height: 60))
                }
                
                VStack(alignment: .leading) {
                    // content element might have nil values
                    // safe checks to generates Texts UI elements
                    // data might be nil
                    if contentDataRow.cId != nil {
                        Text("ID: " + contentDataRow.cId!)
                            .font(.headline)
                            .lineLimit(1)
                    }
                    HStack {
                        // date might be nil
                        if contentDataRow.date != nil {
                            Text(contentDataRow.date!)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.top, 6.0)
                                .padding(.trailing, 6.0)
                                .foregroundColor(Color(red: 186.0/255, green: 36.0/255, blue: 61.0/255))
                        }
                        Spacer()
                        // type might be nil
                        if contentDataRow.type != nil {
                            Text("Category: " + contentDataRow.type!.rawValue)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.trailing, 6.0)
                                .foregroundColor(.gray)
                        }
                        
                        
                    } // HStack
                } // VStack
                    .padding(.leading, 5)
                
            } // HStack
                
            
            VStack(alignment: .leading) {
                if contentDataRow.data != nil {
                    Text(contentDataRow.data!)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            } // VStack
            .padding(.top, 5)
        } // VStack
        .frame(height: 150.0)
        
        
    } // View
}


struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow(contentDataRow: ContentData(id: UUID(),
                                            cId: "1",
                                            type: .image,
                                            date: "15/05/2017",
                                            data: "https://placeimg.com/620/320/any"))
    }
}
