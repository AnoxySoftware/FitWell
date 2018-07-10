//
//  FitWellTests.swift
//  FitWellTests
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import XCTest
@testable import FitWell

class FitWellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRacesDataModel() {
        let testBundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        guard let ressourceURL = testBundle.url(forResource: "racesTest", withExtension: "json") else {return}
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            let racesArray = try decoder.decode([RacesModel].self, from: sampleData)
            let racesData = racesArray.first
            
            XCTAssertEqual(racesArray.count, 3)
            XCTAssertNotNil(racesData)
            
            XCTAssertEqual(racesData?.bgImageURL, URL(string:"https://images.unsplash.com/photo-1523052144643-c9d1f6a5186b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=65f0404fcd1672e6fbc06cbb09b3359e&auto=format&fit=crop&w=640&q=80"))
            XCTAssertEqual(racesData?.hasDetails, true)
            XCTAssertEqual(racesData?.locationName, "Paris")
            XCTAssertEqual(racesData?.profileImageUrl, URL(string:"https://randomuser.me/api/portraits/men/17.jpg"))
            XCTAssertEqual(racesData?.raceDuration, 1314000)
            XCTAssertEqual(racesData?.raceLength, 42.1)
            XCTAssertEqual(racesData?.userCount, 3)
        }
        catch let error {
            print("Error parsing data:\(error.localizedDescription)")
        }
    }
    
    func testRacesViewModel() {
        let testBundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        guard let ressourceURL = testBundle.url(forResource: "racesTest", withExtension: "json") else {return}
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            let racesArray = try decoder.decode([RacesModel].self, from: sampleData)
            let racesVM = RacesVM(racesArray: racesArray)
            let dataRow = racesVM.dataForIndexPath(indexPath: IndexPath(row: 0, section: 0))
            
            XCTAssertEqual(racesVM.hasData(), true)
            XCTAssertEqual(racesVM.numberOfItemsInSection(section: 0), 3)
            XCTAssertNotNil(dataRow)
            XCTAssertEqual(dataRow.bgURLString, "https://images.unsplash.com/photo-1523052144643-c9d1f6a5186b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=65f0404fcd1672e6fbc06cbb09b3359e&auto=format&fit=crop&w=640&q=80")
            XCTAssertEqual(dataRow.detailsHidden, false)
            XCTAssertEqual(dataRow.duration, "15d 5h")
            XCTAssertEqual(dataRow.length, "42.1 KM")
            XCTAssertEqual(dataRow.location, "Paris")
            XCTAssertEqual(dataRow.profileURLString, "https://randomuser.me/api/portraits/men/17.jpg")
            XCTAssertEqual(dataRow.userRaces, "3")
            
        }
        catch let error {
            print("Error parsing data:\(error.localizedDescription)")
        }
    }
    
    func testDetailsDataModel() {
        let testBundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        guard let ressourceURL = testBundle.url(forResource: "profileTest", withExtension: "json") else {return}
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            let userData = try decoder.decode(UserData.self, from: sampleData)
            
            XCTAssertEqual(userData.profile?.email, "adriana.lima@gmail.com")
            XCTAssertEqual(userData.profile?.gender, "female")
            XCTAssertEqual(userData.profile?.profileImageURL, "https://cdn.cliqueinc.com/posts/236071/adriana-lima-makeup-236071-1505846993191-main.640x0c.jpg")
            XCTAssertEqual(userData.profile?.firstName, "Adriana")
            XCTAssertEqual(userData.profile?.lastName, "Lima")
            XCTAssertEqual(userData.profile?.street, "Oxford Street 23d")
            XCTAssertEqual(userData.profile?.city, "London")
            XCTAssertEqual(userData.profile?.country, "England")
            XCTAssertEqual(userData.profile?.lat, "51.509865")
            XCTAssertEqual(userData.profile?.lon, "-0.118092")
            XCTAssertEqual(userData.profile?.verified, true)
        }
        catch let error {
            print("Error parsing data:\(error.localizedDescription)")
        }
    }
    
    func testDetailsViewModel() {
        let testBundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        guard let ressourceURL = testBundle.url(forResource: "profileTest", withExtension: "json") else {return}
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            let userData = try decoder.decode(UserData.self, from: sampleData)
            let detailsVM = DetailsVM(userData: userData)
            let dataRow = detailsVM.dataForIndexPath(indexPath: IndexPath(row: 0, section: 0))
            let headerData = detailsVM.dataForHeaderInSection(section: 0)
            
            XCTAssertEqual(detailsVM.hasData(), true)
            XCTAssertEqual(detailsVM.numberOfItemsInSection(section: 0), 3)
            XCTAssertNotNil(dataRow)
            XCTAssertEqual(dataRow?.transportationType, "Bus")
            XCTAssertEqual(dataRow?.image, "bus")
            XCTAssertEqual(dataRow?.time, "18:15")
            XCTAssertEqual(dataRow?.description, "Carry out a random act of kindness, with no expectation of reward, safe in the knowledge that one day someone might do the same for you.")
            XCTAssertNotNil(headerData)
            XCTAssertEqual(headerData?.address, "London, England")
            XCTAssertEqual(headerData?.latitude, 51.509865)
            XCTAssertEqual(headerData?.longitude, -0.118092)
            XCTAssertEqual(headerData?.profileImageURLString, "https://cdn.cliqueinc.com/posts/236071/adriana-lima-makeup-236071-1505846993191-main.640x0c.jpg")
            XCTAssertEqual(headerData?.profileName, "Adriana Lima")
            XCTAssertEqual(headerData?.totalTime, TimeInterval(129600).timeIntervalAsString(allowedUnits: [.day,.hour]))
            XCTAssertEqual(headerData?.totalDistance, "153")
            XCTAssertEqual(headerData?.totalCalories, "10690")
        }
        catch let error {
            print("Error parsing data:\(error.localizedDescription)")
        }
    }
    
}
