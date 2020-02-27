//
//  DetailsView.swift
//  iOS-Challenge
//
//  Created by Chris on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

// Struct DetailsView - View
// default view when clicking on a HomeViewRow
struct DetailsView: View {
    
    // MARK: - Variables
    // EnvironmentObject: shared HomeViewModel model
    // ensures that data stays updated
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    // ContentData contentDataRow: instance element representing
    // one element of the content
    var contentDataRow : ContentData
    
    // MARK: - Body
    var contentDataRowIndex: Int {
        homeViewModel.contentData.firstIndex(where: { $0.id == contentDataRow.id })!
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center) {
                    // if element is an image and the data field isn't empty
                    if self.contentDataRow.type == .image && self.contentDataRow.data != nil {
                        // generate an image from URL contained in .data
                        ImageView(url: self.contentDataRow.data!, desiredSize: CGSize(width: geometry.size.width, height: geometry.size.width))
                        
                    }
                    else {
                        // generate a default image
                        ImageViewDefault(desiredSize: CGSize(width: geometry.size.width, height: geometry.size.width))
                    }
                    
                    HStack(alignment: .center) {
                        
                        if self.contentDataRow.date != nil {
                            Text(self.contentDataRow.date!)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.leading, 20.0)
                                .foregroundColor(Color(red: 186.0/255, green: 36.0/255, blue: 61.0/255))
                        }
                        Spacer()
                        
                        if self.contentDataRow.cId != nil {
                            Text("ID: " + self.contentDataRow.cId!)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 186.0/255, green: 36.0/255, blue: 61.0/255))
                                .padding(.trailing, 20)
                        }
                    } // HStack
                    
                    // data might be nil
                    if self.contentDataRow.data != nil {
                        Text(self.contentDataRow.data!)
                            .multilineTextAlignment(.leading)
                            .padding(.all, 20)
                    }
                    
                } // VStack
            } // ScrollView
                .navigationBarTitle("Details", displayMode: .inline)
        } // GeometryReader
    } // View
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(contentDataRow: ContentData(id: UUID(),
                                                cId: "1",
                                                type: .image,
                                                date: "15/05/2017",
                                                data: "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like."))
            .environmentObject(HomeViewModel())
    }
}
