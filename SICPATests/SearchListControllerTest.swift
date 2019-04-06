//
//  SearchModelTest.swift
//  SICPATests
//
//  Created by Tharun Menon on 06/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import XCTest
@testable import SICPA

class SearchModelTest: XCTestCase {
    
    var searchListControllerUnderTest: SearchListTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.searchListControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "SearchListTableViewController") as? SearchListTableViewController
        self.searchListControllerUnderTest.filterValue = "Election"
        self.searchListControllerUnderTest.viewDidLoad()
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

}
