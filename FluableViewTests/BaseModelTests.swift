//
//  BaseModelTests.swift
//  FluableView
//
//  Created by Samuel Grau on 02/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import XCTest
@testable import FluableView

class BaseModelTests: XCTestCase {
  
  func testBaseModelDataLoadableImplementation() {
    let baseModel = BaseModel()
    XCTAssertFalse(baseModel.isLoading())
    XCTAssertTrue(baseModel.isLoaded())
    XCTAssertFalse(baseModel.isOutdated())
    XCTAssertTrue(baseModel.shouldLoad())
    XCTAssertFalse(baseModel.hasContent())
    baseModel.cancelLoading()
  }
}
