//
//  MockHapticTuple.swift
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 25/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import UIKit
@testable import PKHapticFeedback

@available(iOS 10.0, *)
final class MockHapticTuple: HapticTupleDefining {
  
  let style: HapticType
  let generator: FeedbackGenerating
  var capturedThread: Thread
  
  init() {
    self.style = .notification(.error)
    self.generator = style.createGenerator()
    self.capturedThread = Thread.current
  }
  
  func generateFeedback() {
    capturedThread = Thread.current
    generator.generateFeedback(type: style)
  }
  
  func prepare() {
    capturedThread = Thread.current
    generator.prepareGenerator()
  }
  
}
