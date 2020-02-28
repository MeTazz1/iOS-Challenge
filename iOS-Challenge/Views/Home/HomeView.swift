//
//  HomeView.swift
//  iOS-Challenge
//
//  Created by Chris on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

// Struct HomeView - View
// main and first view of the app
struct HomeView: View {
    
    // MARK: - Variables
    // EnvironmentObject: userdata, shares HomeViewModel model
    // ensures that data stays updated 
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    // Array of string: filters
    // used to generate the Segmented Picker
    private var filters = ["All", "image", "text", "other"]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Filter by:")
                    
                    Picker(selection: $homeViewModel.filterBy, label: Text("Filter By")) {
                        ForEach(self.filters, id: \.self) { filter in
                            Text(filter)
                        }
                    } // Picker
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                // Parsing ViewModel's data to create UI
                ForEach(self.homeViewModel.contentData) { contentDataRow in
                    // Filters helping to find out if this row should be displayed or not
                    // depending on HomeViewModel Observable Object
                    if self.homeViewModel.filterBy == "All" || contentDataRow.type!.rawValue == self.homeViewModel.filterBy {
                        NavigationLink(destination: DetailsView(contentDataRow: contentDataRow)) {
                            HomeRow(contentDataRow: contentDataRow)
                        }
                    }
                } // ForEach
            } // List
            .navigationBarTitle(Text("Home"))
        } // NavigationView
            
            
            // This code temporarly fixes the current bug
            // preventing the HomeView to be displayed on iPads
        .navigationViewStyle(StackNavigationViewStyle())
        .padding(0)
        
        
    } // View
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
