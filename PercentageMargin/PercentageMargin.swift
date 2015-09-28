import UIKit

/**

Create auto layout constraints for relative margin between a view and its superview. The margin
is expressed as percentages of superview size. The new constraints created by the functions will need to be activate with NSLayoutConstraint.activateConstraints function.

*/
public struct PercentageMargin {
  
  /// Create consraints for equal margins on four sides of the subview.
  public static func createConstraintsOnFourSides(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> [NSLayoutConstraint] {
      
    let vertical = createVerticalConstraints(subview,
      superview: superview, marginPercentage: marginPercentage)
    
    let horizontal = createHorizontalConstraints(subview,
      superview: superview, marginPercentage: marginPercentage)
    
    return Array([vertical, horizontal].flatten())
  }
  
  /// Create constraints for equal top and bottom margins.
  public static func createVerticalConstraints(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> [NSLayoutConstraint] {
      
    let top = createVerticalConstraint(subview,
      superview: superview, top: true, marginPercentage: marginPercentage)
    
    let bottom = createVerticalConstraint(subview,
      superview: superview, top: false, marginPercentage: marginPercentage)
    
    return [top, bottom]
  }
  
  /// Create constraints for equal leading and trailing margins.
  public static func createHorizontalConstraints(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> [NSLayoutConstraint] {
    
    let leading = createHorizontalConstraint(subview,
      superview: superview, leading: true, marginPercentage: marginPercentage)
      
    let trailing = createHorizontalConstraint(subview,
      superview: superview, leading: false, marginPercentage: marginPercentage)
      
    return [leading, trailing]
  }
  
  /// Create constraint for the top margin.
  public static func createTopConstraint(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
      
    return createVerticalConstraint(subview, superview: superview, top: true,
      marginPercentage: marginPercentage)
  }
  
  /// Create constraint for the bottom margin.
  public static func createBottomConstraint(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
      
    return createVerticalConstraint(subview, superview: superview, top: false,
      marginPercentage: marginPercentage)
  }
  
  /// Create constraint for the leading margin.
  public static func createLeadingConstraint(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
      
    return createHorizontalConstraint(subview, superview: superview, leading: true,
      marginPercentage: marginPercentage)
  }
  
  /// Create constraint for the trailing margin.
  public static func createTrailingConstraint(subview: UIView,
    superview: UIView,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
    
    return createHorizontalConstraint(subview, superview: superview, leading: false,
      marginPercentage: marginPercentage)
  }
  
  private static func createHorizontalConstraint(subview: UIView,
    superview: UIView, leading: Bool,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
      
    let multiplier = calculateMultiplier(leading,
      rightToLeft: isRightToLeftLayout(subview), marginPercentage: marginPercentage)
    
    let firstAttribute: NSLayoutAttribute = leading ? .Leading : .Trailing
    let secondAttribute: NSLayoutAttribute = isRightToLeftLayout(subview) ? .Leading : .Trailing
    
    return NSLayoutConstraint(
      item: subview,
      attribute: firstAttribute,
      relatedBy: .Equal,
      toItem: superview,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: 0)
  }
  
  private static func createVerticalConstraint(subview: UIView,
    superview: UIView, top: Bool,
    marginPercentage: CGFloat) -> NSLayoutConstraint {
      
    let multiplier = calculateMultiplier(top,
      rightToLeft: false, marginPercentage: marginPercentage)
    
    let firstAttribute: NSLayoutAttribute = top ? .Top : .Bottom
    let secondAttribute: NSLayoutAttribute = .Bottom
    
    return NSLayoutConstraint(
      item: subview,
      attribute: firstAttribute,
      relatedBy: .Equal,
      toItem: superview,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: 0)
  }
  
  private static func calculateMultiplier(var leading: Bool, rightToLeft: Bool,
    marginPercentage: CGFloat) -> CGFloat {
      
    if rightToLeft { leading = !leading }
      
    var result: CGFloat = 1.0 - marginPercentage / 100
      
    if leading {
      result = marginPercentage / 100
    }
      
    if result == 0 { result = 0.0001 }
      
    return result
  }
  
  private static func isRightToLeftLayout(view: UIView) -> Bool {
    if #available(iOS 9.0, *) {
      return UIView.userInterfaceLayoutDirectionForSemanticContentAttribute(
        view.semanticContentAttribute) == .RightToLeft
    } else {
      return UIApplication.sharedApplication().userInterfaceLayoutDirection == .RightToLeft
    }
  }
}