//
//  Haptic.swift
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 19/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import Foundation

@available(iOS 10.0, *)
@objc final class Haptic: NSObject {
  
  private let cache: HapticCacheType
  
  override init() {
    self.cache = HapticCache()
  }
  
  init(cache: HapticCacheType = HapticCache()) {
    self.cache = cache
  }
  
  ///Prepare Feedback Generator for Haptic Feedback.
  @objc func prepareForFeedback(type: CompatibleHapticType) {
    let convertedHapticType = HapticType(compatibleHapticType: type)
    prepareFeedbackGenerator(forHapticType: convertedHapticType)
  }
  
  @objc func generateFeedback(type: CompatibleHapticType) {
    let convertedHapticType = HapticType(compatibleHapticType: type)
    generateFeedback(hapticType: convertedHapticType)
  }
  
  func prepareFeedbackGenerator(forHapticType hapticType: HapticTypeDefining) {
    let generatorTuple = cache.generator(forHapticType: hapticType)
    if Thread.isMainThread {
      generatorTuple.prepare()
    } else {
      DispatchQueue.main.sync {
        generatorTuple.prepare()
      }
    }
  }
  
  func generateFeedback(hapticType: HapticTypeDefining) {
    let generatorTuple = cache.generator(forHapticType: hapticType)
    if Thread.isMainThread {
      generatorTuple.generateFeedback()
    } else {
      DispatchQueue.main.sync {
        generatorTuple.generateFeedback()
      }
    }
  }
  
}
