//
//  HapticTests.swift
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 20/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import XCTest
import UIKit
@testable import PKHapticFeedback

class HapticTests: XCTestCase {
  
  var haptic: Haptic?
  var mockCache: MockHapticCache?
  var mockHapticType: MockHapticType?
  var mockHapticTuple: MockHapticTuple?
  
  override func setUp() {
    super.setUp()
    mockHapticType = MockHapticType()
    mockHapticTuple = MockHapticTuple()
    mockCache = MockHapticCache()
    mockCache?.hapticTupleToReturn = mockHapticTuple
    haptic = Haptic(cache: mockCache!)
  }
  
  override func tearDown() {
    super.tearDown()
    mockHapticType = nil
    mockCache = nil
    haptic = nil
  }
  
  func testGenerateFeedbackFunctionObtainsGeneratorFromCache() {
    haptic?.generateFeedback(hapticType: mockHapticType!)
    XCTAssertEqual(mockCache?.generatorForHapticTypeCallCount, 1)
    XCTAssertNotNil(mockCache?.capturedHapticType as? MockHapticType)
  }
  
  func testMultipleGenerateFeedbackCalls() {
    haptic?.generateFeedback(hapticType: mockHapticType!)
    haptic?.generateFeedback(hapticType: mockHapticType!)
    haptic?.generateFeedback(hapticType: mockHapticType!)
    XCTAssertEqual(mockCache?.generatorForHapticTypeCallCount, 3)
    XCTAssertNotNil(mockCache?.capturedHapticType as? MockHapticType)
  }
  
  func testPrepareForFeedbackForErrorNotification() {
    haptic?.prepareFeedbackGenerator(forHapticType: mockHapticType!)
    XCTAssertEqual(mockCache?.generatorForHapticTypeCallCount, 1)
    XCTAssertNotNil(mockCache?.capturedHapticType as? MockHapticType)
  }
  
  func testGenerateFeedbackFunctionIsExecutedInMainThread() {
    DispatchQueue.global(qos: .default).sync {
      self.haptic?.generateFeedback(hapticType: self.mockHapticType!)
      let hapticTuple = self.mockCache?.hapticTupleToReturn as? MockHapticTuple
      XCTAssertTrue(hapticTuple!.capturedThread.isMainThread)
    }
  }
  
  func testPrepareForFeedbackFunctionIsExecutedInMainThread() {
    DispatchQueue.global(qos: .default).sync {
      self.haptic?.prepareFeedbackGenerator(forHapticType: mockHapticType!)
      let hapticTuple = self.mockCache?.hapticTupleToReturn as? MockHapticTuple
      XCTAssertTrue(hapticTuple!.capturedThread.isMainThread)
    }
  }
  
}
