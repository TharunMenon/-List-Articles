//
//  ArticleModelTest.swift
//  SICPATests
//
//  Created by Tharun Menon on 06/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import XCTest
@testable import SICPA

class ArticleModelTest: XCTestCase {
    
    var articleControllerUnderTest: ArticleListTableViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.articleControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ArticleListTableViewController") as? ArticleListTableViewController
        self.articleControllerUnderTest.selectType = 0
        self.articleControllerUnderTest.viewDidLoad()
        }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasATableView() {
    XCTAssertNotNil(articleControllerUnderTest.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(articleControllerUnderTest.tableView.delegate)
    }
    
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(articleControllerUnderTest.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(articleControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(articleControllerUnderTest.responds(to: #selector(articleControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(articleControllerUnderTest.responds(to: #selector(articleControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(articleControllerUnderTest.responds(to: #selector(articleControllerUnderTest.tableView(_:cellForRowAt:))))
    }
   
}
