//
//  HomeViewModel.swift
//  iOS-Challenge
//
//  Created by Christophe Dlc on 2/25/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI
import Combine
import Alamofire


// HomeView - ViewModel
// Final Class HomeViewModel - Shared Observable Object
// Stores persistent properties between Views
final class HomeViewModel: ObservableObject  {
    
    // MARK: - Variables
    // String filterBy: used to filter by categories on HomeView
    // Published: observable objects that automatically announce when changes occur
    @Published var filterBy: String = "All"
    
    // Array of RowData: JSON Content from
    // https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json
    // Published: observable objects that automatically announce when changes occur
    @Published var contentData : [ContentData] = [ContentData]()
    
    // MARK: - Methods
    // HomeViewModel init
    // calling loadContent(), which initiates the process of getting JSON data from URL
    init() {
        loadContent()
    }
    
    // method loadContent
    // initiates the Alamofire Request to the specified URL address
    // receives a data, converted to string, then to an array of Dictionnary<String, AnyObject?>
    // each element of this array is serialized into a ContentData object
    // pushed into the Observable Object contentData of HomeViewModel
    func loadContent()
    {
        /*
         //UNCOMMENT THIS TO POPULATE A LIST OF DATA FOR TEST PURPOSES
         contentData.append(ContentData(cId: "1", type: .image, date: "15/01/2017", data: "hello1"))
         contentData.append(ContentData(cId: "2", type: .text, date: "15/02/2017", data: "hello2"))
         contentData.append(ContentData(cId: "3", type: .text, date: "15/03/2017", data: "hello3"))
         contentData.append(ContentData(cId: "4", type: .image, date: "15/04/2017", data: "hello4"))
         contentData.append(ContentData(cId: "5", type: .other, date: "15/05/2017", data: "hello5"))
         contentData.append(ContentData(cId: "6", type: .image, date: "15/06/2017", data: "hello6"))
         */
        
        
        // COMMENT THIS TO PART TO REMOVE THE DOWNLOAD OF THE REMOTE CONTENT
        let url = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
        
        // Create a new asyn thread to download data
        DispatchQueue.global().async {
            AF.request(url)
                .responseJSON { response in
                    if let json = response.value {
                        // go from data to [Dictionary<String, String>]
                        if let jsonArray = json as? [Dictionary<String, String>] {
                            for i in 0 ..< jsonArray.count {
                                // from [Dictionary<String, String>] to Dictionary<String, String>
                                let jsonDict = jsonArray[i]
                                let newObj: ContentData = ContentData(cId: jsonDict["id"] ?? nil,
                                                                      type: ContentData.ContentType(rawValue: jsonDict["type"] ?? "other"),
                                                                      date: jsonDict["date"] ?? nil,
                                                                      data: jsonDict["data"] ?? nil)
                                
                                // calling observable object changes on main thread
                                // for UI updates
                                DispatchQueue.main.async {
                                    self.contentData.append(newObj)
                                }
                            }
                        }
                    }
            }
        }
    }
}
