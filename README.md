# PKHapticFeedback

An easy-to-use, drop-in replacement to the iOS 11 Haptic Feedback APIs, compatible with Objective-C and Swift Projects. 

Always runs on the main thread, interoperable with Objective-C, and with automatic memory management for different types of feedback generators. Feedback generators are re-used if they are of the same type, as they are stored in `HapticCache`. 

No need to manually manage different types of generators, simply instantiate the Haptic class, and use as shown below.

## Installation

Drag and drop the PKHapticFeedback files into your project to get started. (FeedbackGenerating.swift, Haptic.swift, HapticCache.swift, HapticTuple.swift, and HapticType.swift)

Then import the framework as follows, for Objective-C Projects:

```
#import "PKHapticFeedback-Swift.h"
```

Or as follows for Swift projects:

```
#import "PKHapticFeedback"
```

## Guide

To get started, instantiate the `Haptic` class:

```
let haptic = Haptic()
```

Or,

```
Haptic *haptic = [[Haptic alloc] init];
```

The different types of haptic feedback are listed inside `HapticType`. A `HapticTuple` couples a type with its generator, and is used by `Haptic` to use the cached generators.

Example of generating feedback, in Swift:

```
self.haptic.generateFeedback(hapticType: HapticType.impact(.heavy))
self.haptic.generateFeedback(hapticType: HapticType.impact(.medium))
self.haptic.generateFeedback(hapticType: HapticType.impact(.light))
self.haptic.generateFeedback(hapticType: HapticType.notification(.warning))
self.haptic.generateFeedback(hapticType: HapticType.notification(.error))
self.haptic.generateFeedback(hapticType: HapticType.selection)
```

In Objective-C:
```
[self.haptic generateFeedbackWithType:CompatibleHapticTypeHeavy];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeMedium];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeLight];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeWarning];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeError];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeSuccess];
[self.haptic generateFeedbackWithType:CompatibleHapticTypeSelection];
```

Preparing the generator can reduce latency when triggering feedback. This is particularly important when trying to match feedback to sound or visual cues.

Example usage:

```
self.haptic.prepareFeedbackGenerator(forHapticType: HapticType.impact(.light))
```

Unit tests have been included which make use of dependency injection, stubbing, and mocks.

## License

You can use this freely in your projects as you wish but please email me at some point at pranavkasetti@gmail.com just so I can see how you have used it, thanks.

```
The MIT License (MIT)

Copyright (c) 2015 Pranav Kasetti

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
