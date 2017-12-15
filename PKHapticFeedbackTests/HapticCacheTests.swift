//
//  PKHapticFeedbackTests.swift
//  PKHapticFeedbackTests
//
//  Created by Pranav Kasetti on 10/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import XCTest
import UIKit
@testable import PKHapticFeedback

class HapticCacheTests: XCTestCase {
  
  var hapticCache: HapticCache?
  var mockHapticType: MockHapticType?
  
  override func setUp() {
    super.setUp()
    mockHapticType = MockHapticType()
    hapticCache = HapticCache()
  }
  
  override func tearDown() {
    super.tearDown()
    mockHapticType = nil
    hapticCache = nil
  }
  
  func testGeneratorFunctionReturnsNonNilHapticTuple() {
    let hapticTuple = hapticCache?.generator(forHapticType: mockHapticType!)
    XCTAssertNotNil(hapticTuple)
  }
  
  func testGeneratorFunctionReturnsErrorNotificationStyleHapticTuple() {
    let hapticTuple = hapticCache?.generator(forHapticType: mockHapticType!)
    XCTAssertEqual(hapticTuple?.style, HapticType.notification(.error))
  }
  
  func testGeneratorFunctionReturnsErrorNotificationGeneratorHapticTuple() {
    let hapticTuple = hapticCache?.generator(forHapticType: mockHapticType!)
    XCTAssertNotNil(hapticTuple?.generator as? UINotificationFeedbackGenerator)
  }
  
  func testGeneratorFunctionCallsHapticTuple() {
    let _ = hapticCache?.generator(forHapticType: mockHapticType!)
    XCTAssertEqual(mockHapticType!.hapticTupleFunctionCallCount, 1)
  }

}
