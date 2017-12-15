//
//  HapticTuple.swift
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 19/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import Foundation

@available(iOS 10.0, *)
protocol HapticTupleDefining {
  var style: HapticType { get }
  var generator: FeedbackGenerating { get }
  func generateFeedback()
  func prepare()
}

@available(iOS 10.0, *)
final class HapticTuple: HapticTupleDefining {
  let style: HapticType
  let generator: FeedbackGenerating
  
  init(style: HapticType) {
    self.style = style
    self.generator = style.createGenerator()
  }
  
  func generateFeedback() {
    generator.generateFeedback(type: style)
  }
  
  func prepare() {
    generator.prepareGenerator()
  }
		
}
