//
//  MockDataCreator.swift
//
//

import Foundation

enum MockDataCreatorError : Error {
    case RuntimeError(String)
}

class MockDataCreator : NSObject {
    var mockDataPlist : String
    
    init(mockDataPlist:String = "Teams", bundle:Bundle = Bundle.main) {
        self.mockDataPlist = mockDataPlist
        super.init()
    }
    
}
