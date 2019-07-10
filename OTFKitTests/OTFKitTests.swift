//
//  OTFKitTests.swift
//  OTFKitTests
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import XCTest
@testable import OTFKit

class OTFKitTests: XCTestCase {
	typealias OTFB = OTFBase
	typealias OTFS = OTFSelector
	typealias OTFT = OTFType<OTFS>
	typealias OTFA = OTFAxis
	
	var b1: OTFB!; var b2: OTFB!; var b3: OTFB!
	
	var s1: OTFS!; var s2: OTFS!; var s3: OTFS!
	
	var t1: OTFT!; var t2: OTFT!; var t3: OTFT!
	
	var a1: OTFA!; var a2: OTFA!; var a3: OTFA!
	
	
    override func setUp() {
		super.setUp()
		
		b1 = OTFB(name: "One", nameID: 1, identifier: 1)
		b2 = OTFB(name: "One", nameID: 2, identifier: 1)
		b3 = OTFB(name: "Two", nameID: 3, identifier: 2)
		
		s1 = OTFS(name: "One", nameID: 1, identifier: 1, defaultSelector: 1)
		s2 = OTFS(name: "One", nameID: 3, identifier: 3, defaultSelector: 4)
		s3 = OTFS(name: "Two", nameID: 1, identifier: 1, defaultSelector: 1)
		
		t1 = OTFT(name: "One", nameID: 1, identifier: 1, exclusive: 1)
		t2 = OTFT(name: "One", nameID: 1, identifier: 1, exclusive: 1, selectors: [s1, s2, s3])
		t3 = OTFT(name: "One", nameID: 2, identifier: 1, exclusive: 1, selectors: [])
		
		a1 = OTFA(identifier: 0, name: "One", min: 0, default: 500, max: 1000)
		a2 = OTFA(identifier: 0, name: "Two", min: 0, default: 500, max: 1000)
		a3 = OTFA(identifier: 0, name: "Two", min: 0, default: 500, max: 1000)
    }

    override func tearDown() {
		super.tearDown()
		b1 = nil; b2 = nil; b3 = nil
		s1 = nil; s2 = nil; s3 = nil
		t1 = nil; t2 = nil; t3 = nil	
    }

	func testOTFClassesEqual() {
		XCTAssertTrue(b1 == b2)
		XCTAssertFalse(b2 == b3)
		XCTAssertTrue(s1 == s2)
		XCTAssertFalse(s2 == s3)
		XCTAssertTrue(t1 == t2)
		XCTAssertFalse(b2 == b3)
		
	}
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
