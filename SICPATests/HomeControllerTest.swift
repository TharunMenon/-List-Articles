//
//  HomeControllerTest.swift
//  SICPATests
//
//  Created by Tharun Menon on 06/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import XCTest
@testable import SICPA

class HomeControllerTest: XCTestCase {

    var homeControllerUnderTest: HomeTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.homeControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "HomeTableViewController") as? HomeTableViewController
        
        self.homeControllerUnderTest.viewDidLoad()
        
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasATableView() {
        XCTAssertNotNil(homeControllerUnderTest.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(homeControllerUnderTest.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(homeControllerUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(homeControllerUnderTest.responds(to: #selector(homeControllerUnderTest.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(homeControllerUnderTest.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(homeControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(homeControllerUnderTest.responds(to: #selector(homeControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(homeControllerUnderTest.responds(to: #selector(homeControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(homeControllerUnderTest.responds(to: #selector(homeControllerUnderTest.tableView(_:cellForRowAt:))))
    }
    
    

}
