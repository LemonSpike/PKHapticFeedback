//
//  MockHapticType.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 20/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import Foundation
import UIKit
@testable import PKHapticFeedback

@available(iOS 10.0, *)
public class MockHapticType: HapticTypeDefining {
  
  var hapticTupleFunctionCallCount = 0
  var hapticTupleToReturn: HapticTupleDefining?
  
  public func hapticTuple() -> HapticTupleDefining {
    hapticTupleFunctionCallCount += 1
    hapticTupleToReturn = HapticTuple(style: HapticType.notification(.error))
    return hapticTupleToReturn!
  }
  
  public var description: String {
    return "Test Stub Haptic Type"
  }
  
  public func createGenerator() -> FeedbackGenerating {
    return  UINotificationFeedbackGenerator()
  }
  
}
