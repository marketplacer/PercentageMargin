import UIKit
import PercentageMargin

class ViewController: UIViewController {

  @IBOutlet weak var superviewWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak var superviewHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var superviewWidthSlider: UISlider!
  
  @IBOutlet weak var subviewMarginSlider: UISlider!
  @IBOutlet weak var subviewMarginLabel: UILabel!
  
  @IBOutlet weak var subview: UIView!
  @IBOutlet weak var superview: UIView!
  
  var marginConstraints = [NSLayoutConstraint]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupSuperviewSizeSlider()
    updateSuperviewSize()
    
    setupSubviewMarginSlider()
    updateSubviewMargin()
  }
  
  // MARK: - Superview size
  
  private func setupSuperviewSizeSlider() {
    superviewWidthSlider.minimumValue = DemoConstants.superviewMinSize
    superviewWidthSlider.maximumValue = DemoConstants.superviewMaxSize
    superviewWidthSlider.value = DemoConstants.superviewStartSize
  }
  
  @IBAction func didChangeSuperviewWidthSlider(sender: AnyObject) {
    updateSuperviewSize()
  }
  
  private func updateSuperviewSize() {
    let constant = CGFloat(superviewWidthSlider.value)
    superviewWidthConstraint.constant = constant
    superviewHeightConstraint.constant = constant / 2
  }
  
  // MARK: - Subview margin
  
  private func setupSubviewMarginSlider() {
    subviewMarginSlider.minimumValue = DemoConstants.subviewMarginMin
    subviewMarginSlider.maximumValue = DemoConstants.subviewMarginMax
    subviewMarginSlider.value = DemoConstants.subviewStartMargin
  }
  
  @IBAction func didChangeSubviewMarginSlider(sender: AnyObject) {
    updateSubviewMargin()
  }
  
  private func updateSubviewMargin() {
    let constant = Int(subviewMarginSlider.value)
    
    subviewMarginLabel.text = "Margin: \(constant)%"
    
    NSLayoutConstraint.deactivateConstraints(marginConstraints)
    
    marginConstraints = PercentageMargin.createConstraintsOnFourSides(subview, superview: superview,
      marginPercentage: CGFloat(constant))
    
    NSLayoutConstraint.activateConstraints(marginConstraints)
  }
}

