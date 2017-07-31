//
//  MockHapticCache.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 20/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import Foundation
import UIKit
@testable import PKHapticFeedback

@available(iOS 10.0, *)
final class MockHapticCache: HapticCacheType {
  
  var generatorForHapticTypeCallCount = 0
  var capturedHapticType: HapticTypeDefining?
  var hapticTupleToReturn: HapticTupleDefining?
  
  func generator(forHapticType hapticType: HapticTypeDefining) -> HapticTupleDefining {
    generatorForHapticTypeCallCount += 1
    capturedHapticType = hapticType
    return hapticTupleToReturn!
  }
  
}
