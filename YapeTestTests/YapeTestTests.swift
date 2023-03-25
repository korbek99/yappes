//
//  YapeTestTests.swift
//  YapeTestTests
//
//  Created by Jose David Bustos H on 17-02-23.
//

import XCTest
@testable import YapeTest

class YapeTestTests: XCTestCase {

    var sut : MenuViewController!
    
    override func setUpWithError() throws {
        sut = MenuViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    // Menu
//    func test_setupVM() throws {
//        _ = sut.view
//        XCTAssertNotNil(sut.menuListVM, "Menu Lista contiene datos")
//    }
    func test_setupSearch() throws {
        _ = sut.view
        XCTAssertNotNil(sut.searchedMenu, "Menu Lista contiene datos")
    }
    func test_TableViewMenu() throws {
        _ = sut.view
        XCTAssertNotNil(sut.tableView, "Menu contiene datos")
    }
    func test_TableViewDataSource() throws {
        _ = sut.view
        XCTAssertNotNil(sut.tableView.dataSource, "Menu contiene dataSource")
    }
    
    //Details Menu
//    func test_MenuTitleString() throws {
//        var vc : DetailsViewController!
//         vc = DetailsViewController()
//        _ = vc.view
//        XCTAssertNotNil(vc.nombreString, "Details contiene titulo")
//    }
//    func test_MenuDescripString() throws {
//        var vc : DetailsViewController!
//         vc = DetailsViewController()
//        _ = vc.view
//        XCTAssertNotNil(vc.decripString, "Details contiene descrip")
//    }
//    func test_MenuImageString() throws {
//        var vc : DetailsViewController!
//         vc = DetailsViewController()
//        _ = vc.view
//        XCTAssertNotNil(vc.imageString, "Details contiene image string")
//    }
//    func test_MenuPriceString() throws {
//        var vc : DetailsViewController!
//         vc = DetailsViewController()
//        _ = vc.view
//        XCTAssertNotNil(vc.precio, "Details contiene precio")
//    }
 
    func test_TableViewDetails() throws {
        var vc : DetailsViewController!
         vc = DetailsViewController()
        _ = vc.view
        XCTAssertNotNil(vc.tableView, "tableView Details contiene datos")
    }
    func test_TableViewDetailsDataSource() throws {
        var vc : DetailsViewController!
         vc = DetailsViewController()
        _ = vc.view
        XCTAssertNotNil(vc.tableView.dataSource, "tableView Details contiene dataSource")
    }
    
    //Map Menu
    
//    func test_mapaVarLatitud() throws {
//        var vc : MapiViewController!
//        vc = MapiViewController()
//        _ = vc.view
//
//        XCTAssertNotNil(vc.latitudMap, "Menu contiene Latitud")
//    }
//    func test_mapaVarLongitud() throws {
//        var vc : MapiViewController!
//        vc = MapiViewController()
//        _ = vc.view
//
//        XCTAssertNotNil(vc.lontitudMap, "Menu contiene Latitud")
//    }
}
