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

3) Create outlets for both your *subview* and its *superview* in the view controller.

4) Finally, create the percentage-based constraint between the view or its superview. It can be don e in viewDidLoad. In this example, we create a trailing constraint for 20% margin of the superview width.

```Swift
override func viewDidLoad() {
  super.viewDidLoad()

  let constraint = PercentageMargin.createTrailingConstraint(subview, superview: superview, marginPercentage: 20)
  NSLayoutConstraint.activateConstraints([constraint])
}
```


## Create top, bottom, leading and trailing constraints separately

```Swift
// Create top constraint for 20% margin
let constraintTop = PercentageMargin.createTopConstraint(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints([constraintTop])

// Create bottom constraint for 20% margin
let constraintBottom = PercentageMargin.createBottomConstraint(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints([constraintBottom])

// Create leading constraint for 20% margin
let constraintLeading = PercentageMargin.createLeadingConstraint(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints([constraintLeading])

// Create trailing constraint for 20% margin
let constraintTrailing = PercentageMargin.createTrailingConstraint(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints([constraintTrailing])
```

## Shortcut functions for creating many constrains

```Swift
// Create top and bottom constraints for 20% margin
let constraintVertical = PercentageMargin.createVerticalConstraints(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints(constraintVertical)

// Create leading and trailing constraints for 20% margin
let constraintHorizontal = PercentageMargin.createHorizontalConstraints(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints(constraintHorizontal)

// Create constraints for 20%  margins on four sides of the subview
let constraint4Sides = PercentageMargin.createConstraintsOnFourSides(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints(constraint4Sides)
```