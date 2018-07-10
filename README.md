# Fitwell Sample Code App

[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)](http://developer.apple.com/iOS)&nbsp;

Fitwell Demo App is a coding sample `Swift 4` iOS Application

> The application uses CocoaPods for dependency management

  - Uses `AutoLayout` for the entire UI
  - Uses extensions and subclasses for extra functionality on UI Elements
  - Has `Unit Tests`

### Tech

Explanation of the application design
```
 - Application design pattern is the MVVM pattern for easier testing of the ViewModels and code clarity
 - App uses sample JSON data that where created based on the UI design (lacking of course other data than normally should be there, but for test pursposes data are enough)
 - Uses Protocols for setting up the UI in the custom Cells
 - App uses a UITableView for both screens, bot on the detail view a custom header is used on the top
 - App requires iOS 10 or later to run
 - Has a Thememanager for managing the UI but it's not fully initialized in the current design (just basic sample functionality shown)
 - Has a custom rounded UIView which allows setting it's properties directly through Interface Builder
 - Has a custom UIImageView for the custom round profile image view again with properties settable trhough IB
 - Has only 3 sample elements in the Home (Races) screen, but we can easily add as many as we like by editing the json file server
```

&copy; 2018 Lefteris Haritou
