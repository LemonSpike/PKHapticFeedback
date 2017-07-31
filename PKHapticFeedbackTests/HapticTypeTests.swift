//
//  HapticTypeTests.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 20/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import XCTest
import UIKit
@testable import PKHapticFeedback

class HapticTypeTests: XCTestCase {
  
  let hapticTypes: [HapticType] = [HapticType.notification(.error), HapticType.notification(.warning), HapticType.notification(.success),
                                   HapticType.impact(.heavy), HapticType.impact(.medium), HapticType.impact(.light), HapticType.selection]
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testInitialiserWithCompatibleHapticType() {
    let tempHapticTypes = [HapticType(compatibleHapticType: .error), HapticType(compatibleHapticType: .warning), HapticType(compatibleHapticType: .success), HapticType(compatibleHapticType: .heavy), HapticType(compatibleHapticType: .medium), HapticType(compatibleHapticType: .light), HapticType(compatibleHapticType: .selection)]
    XCTAssertEqual(tempHapticTypes.count, 7)
    for hapticType in tempHapticTypes {
      XCTAssertNotNil(hapticType)
      XCTAssertEqual(hapticType, hapticTypes[tempHapticTypes.index(of: hapticType)!])
    }
  }
  
  func testEqualityFunctionForErrorNotification() {
    let errorNotificationFeedbackType = hapticTypes[0]
    XCTAssert(errorNotificationFeedbackType == HapticType.notification(.error))
    for hapticType in hapticTypes {
      if hapticType != HapticType.notification(.error) {
        XCTAssertNotEqual(errorNotificationFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForWarningNotification() {
    let warningNotificationFeedbackType = hapticTypes[1]
    XCTAssert(warningNotificationFeedbackType == HapticType.notification(.warning))
    for hapticType in hapticTypes {
      if hapticType != HapticType.notification(.warning) {
        XCTAssertNotEqual(warningNotificationFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForSuccessNotification() {
    let successNotificationFeedbackType = hapticTypes[2]
    XCTAssert(successNotificationFeedbackType == HapticType.notification(.success))
    for hapticType in hapticTypes {
      if hapticType != HapticType.notification(.success) {
        XCTAssertNotEqual(successNotificationFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForHeavyImpact() {
    let heavyImpactFeedbackType = hapticTypes[3]
    XCTAssert(heavyImpactFeedbackType == HapticType.impact(.heavy))
    for hapticType in hapticTypes {
      if hapticType != HapticType.impact(.heavy) {
        XCTAssertNotEqual(heavyImpactFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForMediumImpact() {
    let mediumImpactFeedbackType = hapticTypes[4]
    XCTAssert(mediumImpactFeedbackType == HapticType.impact(.medium))
    for hapticType in hapticTypes {
      if hapticType != HapticType.impact(.medium) {
        XCTAssertNotEqual(mediumImpactFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForLightImpact() {
    let lightImpactFeedbackType = hapticTypes[5]
    XCTAssert(lightImpactFeedbackType == HapticType.impact(.light))
    for hapticType in hapticTypes {
      if hapticType != HapticType.impact(.light) {
        XCTAssertNotEqual(lightImpactFeedbackType, hapticType)
      }
    }
  }
  
  func testEqualityFunctionForSelection() {
    let selectionFeedbackType = hapticTypes[6]
    XCTAssert(selectionFeedbackType == HapticType.selection)
    for hapticType in hapticTypes {
      if hapticType != HapticType.selection {
        XCTAssertNotEqual(selectionFeedbackType, hapticType)
      }
    }
  }
  
  func testErrorNotificationFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.notification(.error).description)
    XCTAssertEqual(HapticType.notification(.error).description, "Error")
  }
  
  func testWarningNotificationFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.notification(.warning).description)
    XCTAssertEqual(HapticType.notification(.warning).description, "Warning")
  }
  
  func testSuccessNotificationFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.notification(.success).description)
    XCTAssertEqual(HapticType.notification(.success).description, "Success")
  }
  
  func testHeavyImpactFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.impact(.heavy).description)
    XCTAssertEqual(HapticType.impact(.heavy).description, "Heavy")
  }
  
  func testMediumImpactFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.impact(.medium).description)
    XCTAssertEqual(HapticType.impact(.medium).description, "Medium")
  }
  
  func testLightImpactFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.impact(.light).description)
    XCTAssertEqual(HapticType.impact(.light).description, "Light")
  }
  
  func testSelectionFeedbackTypeDescription() {
    XCTAssertNotNil(HapticType.selection.description)
    XCTAssertEqual(HapticType.selection.description, "Selection")
  }
  
  func testCreateGeneratorFunctionForErrorNotification() {
    let generator = HapticType.notification(.error).createGenerator()
    XCTAssertTrue(generator is UINotificationFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForWarningNotification() {
    let generator = HapticType.notification(.warning).createGenerator()
    XCTAssertTrue(generator is UINotificationFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForSuccessNotification() {
    let generator = HapticType.notification(.success).createGenerator()
    XCTAssertTrue(generator is UINotificationFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForHeavyImpact() {
    let generator = HapticType.impact(.heavy).createGenerator()
    XCTAssertTrue(generator is UIImpactFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForMediumImpact() {
    let generator = HapticType.impact(.medium).createGenerator()
    XCTAssertTrue(generator is UIImpactFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForLightImpact() {
    let generator = HapticType.impact(.light).createGenerator()
    XCTAssertTrue(generator is UIImpactFeedbackGenerator)
  }
  
  func testCreateGeneratorFunctionForSelection() {
    let generator = HapticType.selection.createGenerator()
    XCTAssertTrue(generator is UISelectionFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForErrorNotification() {
    let hapticTuple = HapticType.notification(.error).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.notification(.error))
    XCTAssertNotNil(hapticTuple.generator as? UINotificationFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForWarningNotification() {
    let hapticTuple = HapticType.notification(.warning).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.notification(.warning))
    XCTAssertNotNil(hapticTuple.generator as? UINotificationFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForSuccessNotification() {
    let hapticTuple = HapticType.notification(.success).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.notification(.success))
    XCTAssertNotNil(hapticTuple.generator as? UINotificationFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForHeavyImpact() {
    let hapticTuple = HapticType.impact(.heavy).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.impact(.heavy))
    XCTAssertNotNil(hapticTuple.generator as? UIImpactFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForMediumImpact() {
    let hapticTuple = HapticType.impact(.medium).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.impact(.medium))
    XCTAssertNotNil(hapticTuple.generator as? UIImpactFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForLightImpact() {
    let hapticTuple = HapticType.impact(.light).hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.impact(.light))
    XCTAssertNotNil(hapticTuple.generator as? UIImpactFeedbackGenerator)
  }
  
  func testHapticTupleFunctionForSelection() {
    let hapticTuple = HapticType.selection.hapticTuple()
    XCTAssertNotNil(hapticTuple)
    XCTAssertEqual(hapticTuple.style, HapticType.selection)
    XCTAssertNotNil(hapticTuple.generator as? UISelectionFeedbackGenerator)
  }
  
}
