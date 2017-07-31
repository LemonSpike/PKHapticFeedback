//
//  FeedbackGenerating.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 19/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
protocol FeedbackGenerating {
  func generateFeedback(type: HapticType)
  func prepareGenerator()
}

@available(iOS 10.0, *)
extension UINotificationFeedbackGenerator: FeedbackGenerating {
  
  func generateFeedback(type: CompatibleHapticType) {
    let convertedHapticType = HapticType(compatibleHapticType: type)
    generateFeedback(type: convertedHapticType)
  }
  
  func generateFeedback(type: HapticType) {
    guard case .notification(_) = type else { return }
    switch type {
    case .notification(.error):
      notificationOccurred(.error)
    case .notification(.warning):
      notificationOccurred(.warning)
    case .notification(.success):
      notificationOccurred(.success)
    default:
      break
    }
  }
  
  func prepareGenerator() {
    self.prepare()
  }
}

@available(iOS 10.0, *)
extension UIImpactFeedbackGenerator: FeedbackGenerating {
  
  func generateFeedback(type: CompatibleHapticType) {
    let convertedHapticType = HapticType(compatibleHapticType: type)
    generateFeedback(type: convertedHapticType)
  }
  
  func generateFeedback(type: HapticType) {
    guard case .impact(_) = type else { return }
    impactOccurred()
  }
  
  func prepareGenerator() {
    prepare()
  }
}

@available(iOS 10.0, *)
extension UISelectionFeedbackGenerator: FeedbackGenerating {
  func generateFeedback(type: CompatibleHapticType) {
    let convertedHapticType = HapticType(compatibleHapticType: type)
    generateFeedback(type: convertedHapticType)
  }
  
  func generateFeedback(type: HapticType) {
    guard type == HapticType.selection else { return }
    selectionChanged()
  }
  
  func prepareGenerator() {
    prepare()
  }
}
