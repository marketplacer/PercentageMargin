## Creating percentage-based margin with Auto Layout in iOS / Swift

This is a library of functions for creating percentage-based margins between views and their superviews in iOS. It allows, for example, to create an Auto Layout constraint for the trailing margin of 20% between the view and its superview. Because the margin is percentage-based its absolute size will adapt automatically when the superview size changes.

<img src='https://raw.githubusercontent.com/exchangegroup/PercentageMargin/master/Graphics/overview.png' width='250' alt='Percentage-based margins with Auto Layout on iOS'>


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

// Create constraints for 20% margins on all four sides of the subview
let constraint4Sides = PercentageMargin.createConstraintsOnFourSides(subview, superview: superview, marginPercentage: 20)
NSLayoutConstraint.activateConstraints(constraint4Sides)
```

## How it works

Creating a simple percentage-based constraint can be easily done in the storyboard.
For example, suppose you want to create a *10% trailing margin* constraint. This is how it is done:

1. Create a *trailing* constraint between your view and its superview.
1. Make sure the first constraint item is the subview and the second item is the superview. This can be done by clicking on the *first item* drop down and selecting *Reverse First and Second Item*.
1. Change the *constant* value of the constraint to *zero* in the attributes inspector.
1. Change the *multiplier* value to *0.9*.

<img src='https://raw.githubusercontent.com/exchangegroup/PercentageMargin/master/Graphics/percentage_based_constraints_how_it_works.png' width='516' alt='How percentage-based constraints work in iOS'>

Creating the *leading* margin can be done in a similar way but there are some nuances.

1. You will start by creating a leading constraint.
1. Next, change the second item from the superview leading to *trailing*.
1. Change the *constant* value to *zero* and the *multiplier* value to *0.1*.

You can use the same technique to create top and bottom margins with constraints. Remember to keep superview in the second item and set it to 'bottom'.

## Handling right-to-left language layouts

Unfortunately, the method described above for creating leading and trailing constraints in the storyboard does not work for right-to-left languages. You can see it by running the app in the simulator with the language change to *Right to left pseudolanguage* in option section of the scheme settings.

For the right-to-left language both the *multiplier* and the second constraint item need to be reversed relative to the normal layout. For example, the trailing margin will have multiplier of *0.1* for the right-to-left language and the second item needs to be 'leading' for the trailing constraint.

## Demo app

The project includes a demo iOS apps.

<img src='https://raw.githubusercontent.com/exchangegroup/PercentageMargin/master/Graphics/percentage_margin_auto_layout.gif' alt='Percentage margins with Auto Layout demo iOS app'>

## License

PercentageMargin is released under the [MIT License](LICENSE).