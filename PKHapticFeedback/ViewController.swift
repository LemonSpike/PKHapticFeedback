//
//  ViewController.swift
//  RPHapticFeedback
//
//  Created by Pranav Kasetti on 10/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

@available(iOS 10.0, *)
class ViewController: UIViewController {
  
  var counter = 0
  var count = 0
  let time = 0.1
  let hapticTypes = [HapticType.notification(.warning), HapticType.notification(.error), HapticType.notification(.success), HapticType.impact(.heavy), HapticType.impact(.medium), HapticType.impact(.light), HapticType.selection]
  let haptic = Haptic(cache: HapticCache())
  
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  @IBAction func heavyHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      
      DispatchQueue.global(qos: .default).async {
        self.haptic.generateFeedback(hapticType: HapticType.impact(.heavy))
      }
    }
    
  }
  
  @IBAction func mediumHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.impact(.medium))
    }
    
  }
  
  @IBAction func lightHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.impact(.light))
    }
    
  }
  
  @IBAction func warningHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.notification(.warning))
    }
    
  }
  
  @IBAction func errorHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.notification(.error))
    }
    
  }
  
  @IBAction func successHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.notification(.success))
    }
    
  }
  
  @IBAction func selectionHapticButtonPressed(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      haptic.generateFeedback(hapticType: HapticType.selection)
    }
    
  }
  
  @IBAction func performanceTest(_ sender: Any) {
    
    if segmentedControl.selectedSegmentIndex  == 0 {
      let timer = Timer(fire: Date(), interval: TimeInterval(time), repeats: true, block: { timer in
        self.generateNextFeedbackType()
        self.count = self.count + 1
        if self.count  == 200 {
          self.count = 0
          timer.invalidate()
        }
      })
      RunLoop.current.add(timer, forMode: .commonModes)
    } else {
      let timer = Timer(fire: Date(), interval: TimeInterval(time), repeats: true, block: { timer in
        self.generateNextAlternativeFeedbackType()
        self.count = self.count + 1
        if self.count  == 200 {
          self.count = 0
          timer.invalidate()
        }
      })
      RunLoop.current.add(timer, forMode: .commonModes)
    }
    
  }
  
  @IBAction func objCControllerPushButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let myVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
    self.navigationController?.pushViewController(myVC, animated: false)
  }
  
  
  func generateNextFeedbackType() {
    haptic.generateFeedback(hapticType: hapticTypes[counter])
    if counter != 6 {
      counter = counter + 1
    } else {
      counter = 0
    }
    
  }
  
  func generateNextAlternativeFeedbackType() {
    
    haptic.generateFeedback(hapticType: hapticTypes[counter])
    if counter != 6 {
      counter = counter + 1
    } else {
      counter = 0
    }
    
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
