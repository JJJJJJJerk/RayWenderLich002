
import UIKit

class ViewController: UIViewController {

    @IBOutlet var listView: UIScrollView!
    @IBOutlet var bgImage: UIImageView!
    var selectedImage: UIImageView?
    let transition = PopAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func didTapImageView(tap: UITapGestureRecognizer) {
        selectedImage = tap.view as? UIImageView
        
        let index = tap.view!.tag
        let selectedHerb = herbs[index]
        
        //present details view controller
        let herbDetails = storyboard!.instantiateViewControllerWithIdentifier("HerbDetailsViewController") as! HerbDetailsViewController
        herbDetails.herb = selectedHerb
        herbDetails.transitioningDelegate = self
        presentViewController(herbDetails, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController,
        presentingController presenting: UIViewController,
        sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = selectedImage!.superview!.convertRect(selectedImage!.frame, toView: nil)//convert to the window coordinate system
        transition.presenting =  true

        return transition
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting =  false
        return transition
    }
}