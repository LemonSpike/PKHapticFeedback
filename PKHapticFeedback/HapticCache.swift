//
//  HapticCache.swift
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 19/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import Foundation

@available(iOS 10.0, *)
protocol HapticCacheType {
  func generator(forHapticType hapticType: HapticTypeDefining) -> HapticTupleDefining
}

@available(iOS 10.0, *)
final class HapticCache: NSObject, HapticCacheType {
  
  private var timers: [String:Timer] = [:]
  private var feedbackGenerators: [String: HapticTupleDefining] = [:]
  
  func generator(forHapticType hapticType: HapticTypeDefining) -> HapticTupleDefining {
    guard let feebackTuple = feedbackGenerators[hapticType.description] else {
      let feebackTuple = hapticType.hapticTuple()
      feedbackGenerators[hapticType.description] = feebackTuple
      return feebackTuple
    }
    return feebackTuple
  }
  
  func setTimerToReleaseGenerator(hapticType: HapticTypeDefining) {
    if let timer = timers[hapticType.description] {
      if timer.isValid {
        timer.invalidate()
      }
    }
    timers[hapticType.description] = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] (blockTimer) in
      self?.feedbackGenerators[hapticType.description] = nil
      blockTimer.invalidate()
    }
  }
}
