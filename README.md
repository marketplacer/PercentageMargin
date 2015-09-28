## Creating percentage based margin between a view and its superview with Auto Layout in iOS

This is a collection of functions for creating percentage based margins between views and their superviews in iOS. The margin will be based on the percentage of the superview height or width.


## Setup

There are three ways you can add Dodo to your project.

**Add source (iOS 7+)**

Simply add [PercentageMargin.swift](https://github.com/exchangegroup/PercentageMargin/blob/master/PercentageMargin/PercentageMargin.swift) file into your Xcode project.

**Setup with Carthage (iOS 8+)**

Add `github "exchangegroup/PercentageMargin" ~> 1.0` to your Cartfile and run `carthage update`.

**Setup with CocoaPods (iOS 8+)**

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    pod 'PercentageMargin', '~> 1.0'


## Usage

Add `import PercentageMargin` to your source code if you used Carthage or CocoaPods setup methods.

1) Create a constraint between your view and its superview in the storyboard.
2) Check "remove at build time" option for the constraint in the *attributes inspector*. A percentage-based constraint will be created form the code instead.

<img src='https://raw.githubusercontent.com/exchangegroup/PercentageMargin/master/Graphics/setup_layout_constraint.png' width='480' alt='Setup percentage-based margins with Auto Layout in iOS / Swift'>

3) Create outlets for both your *superview* and its *subview* in the view controller.

4) Finally, create the percentage-based constraint between the view or its superview. It can be don e in viewDidLoad. In this example, we create a trailing margin constraint that will be 20% of superview width.

```Swift
override func viewDidLoad() {
  super.viewDidLoad()

  let constraint = PercentageMargin.createTrailingConstraint(subview, superview: superview, margin: 20)
  NSLayoutConstraint.activateConstraints([constraint])
}
```