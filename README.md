# iOS-Challenge
A SwiftUI project, including Alamofire and using the MVVM pattern.

The purpose of this project is to get started with SwiftUI. 
SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.
Build user interfaces for any Apple device using just one set of tools and APIs.


Finally, SwiftUI introduces a brand new State based way of creating cross-platforms apps, that's cool, with a completely different code style.

If you are new to SwiftUI, please refer to these well-builded tutorials: https://developer.apple.com/tutorials/swiftui/tutorials
  
  
This iOS-Challenge app integrates multiple interesting aspects of SwiftUI, with a layer of Networking with the Alamofire pod, that you can find here :
  https://github.com/Alamofire/Alamofire
  
To use this app, you must run under macOS Catalina (10.15), have XCode 11+ and iOS 13+.

The app is built like so:
  - ViewModels (MVVM Pattern objects)
  - Models (Data Models)
  - Views (UI Views)
    - Home (Home & Main Views)
    - Details (Detail View)
    - Reusables (Reusable UI Elements)
  - Tools (Reusable Tools)
  - Base (The must-have Swift files, such as App/SceneDelegates)
  
One of the cool part of SwiftUI, among others, is that you can create single UI unit tests for each View, which is very helpful during development. 
You can also create very responsive apps in a snap of a finger (good bye Auto-Layout).

In my app, the HomeView.swift file is the Root View Controller, set in SceneDelegate.swift
This view display a list of element, gathered from a specific web URL, based on a set of JSON Objects. 
Once downloaded, the data from this URL is being parsed and converted into ContentData objects. 

The HomeViewModel class, used as an Observable object, will handle the data and its state in the contentData Published property. 
Everytime the data changes, the UI State is invalidated and needs to be reloaded. 
Because contentData is a Published object in an Observable class, all objects observing this property will be notified when it changes. 

Please refer to this example in HomeView.swift, where we iterate over the list of contentData objects stored in the ViewModel property. 
If contentData changes, HomeView will be invalidated as it is listening to this Published property and will be reloaded, with the new content. 

SwiftUI seemns very interesting and promising. It still has a few bugs here and there, but nothing really bad. 

Bugs encoutered:
- Unable of clicking the same row twice (behavior reproductible in Canvas and Simulator, not on real device)
- ScrollView not being generated properly if the content of this View is an observed object and its value changes
- Bug showing a white screen when starting your app on an iPad. It is actually override your RootViewController by showing an emtpy detail view. You must add the following line to your main body:
  .navigationViewStyle(StackNavigationViewStyle())
        .padding(0) // PLEASE NOTE THAT THE PADDING(0) IS MANDATORY, OTHERWISE IT DOESN'T WORK
- A bad error verbose. Sometimes, it will tell you that an error is somewhere very specific with an unclear message. 
  If that's the case and you don't understand why you have this error, refer mostly to your code colors and to your modifiers. The error often comes from the piece of code that isn't colored as it should be ;) ! 

That's pretty much it!

Please feel free to have a look at it and share your impressions to me!

Enjoy :)


