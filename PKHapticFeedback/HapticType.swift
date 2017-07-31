//
//  RPHapticFeedback.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 10/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

import UIKit


@available(iOS 10.0, *)
protocol HapticTypeDefining {
  var description: String { get }
  func createGenerator() -> FeedbackGenerating
  func hapticTuple() -> HapticTupleDefining
}

@available(iOS 10.0, *)
public enum HapticType: Equatable, HapticTypeDefining {

  case notification(UINotificationFeedbackType)
  case impact(UIImpactFeedbackStyle)
  case selection
  
  init(compatibleHapticType: CompatibleHapticType) {
    switch (compatibleHapticType) {
    case .error:
      self = HapticType.notification(.error)
    case .warning:
      self = HapticType.notification(.warning)
    case .success:
      self = HapticType.notification(.success)
    case .heavy:
      self = HapticType.impact(.heavy)
    case .medium:
      self = HapticType.impact(.medium)
    case .light:
      self = HapticType.impact(.light)
    case .selection:
      self = HapticType.selection
    }
  }
  
  public static func ==(lhs: HapticType, rhs: HapticType) -> Bool {
    switch (lhs, rhs) {
    case (.selection, .selection):
      return true
    case (.impact(let lhsType), .impact(let rhsType)):
      return lhsType == rhsType
    case (.notification(let lhsType), .notification(let rhsType)):
      return lhsType == rhsType
    default:
      return false
    }
  }
  
  var description: String {
    switch self {
    case .notification(.error):
      return "Error"
    case .notification(.warning):
      return "Warning"
    case .notification(.success):
      return "Success"
    case .impact(.heavy):
      return "Heavy"
    case .impact(.medium):
      return "Medium"
    case .impact(.light):
      return "Light"
    case .selection:
      return "Selection"
    }
  }
  
  
  func createGenerator() -> FeedbackGenerating {
    switch (self) {
    case .notification(.success),.notification(.warning),.notification(.error):
      return UINotificationFeedbackGenerator()
    case .impact(.heavy):
      return UIImpactFeedbackGenerator(style: .heavy)
    case .impact(.medium):
      return UIImpactFeedbackGenerator(style: .medium)
    case .impact(.light):
      return UIImpactFeedbackGenerator(style: .light)
    case .selection:
      return UISelectionFeedbackGenerator()
    }
  }
  
  func hapticTuple() -> HapticTupleDefining {
    return HapticTuple(style: self)
  }
}

@available(iOS 10.0, *)
@objc public enum CompatibleHapticType: Int {
  case warning = 0
  case error
  case success
  case light
  case medium
  case heavy
  case selection
}
