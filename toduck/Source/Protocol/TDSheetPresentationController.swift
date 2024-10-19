import UIKit
final class TDSheetPresentationControlelr: UIPresentationController{
    override var frameOfPresentedViewInContainerView: CGRect {
        guard
            let containerView = containerView,
            let presentedView = presentedView
        else {
            return super.frameOfPresentedViewInContainerView
        }
        /// The maximum height allowed for the sheet. We allow the sheet to reach the top safe area inset.
        let maximumHeight = containerView.frame.height - containerView.safeAreaInsets.top - containerView.safeAreaInsets.bottom
        
        let fittingSize = CGSize(width: containerView.bounds.width,
                                 height: UIView.layoutFittingCompressedSize.height)
        
        let presentedViewHeight = presentedView.systemLayoutSizeFitting(
            fittingSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        ).height
        /// The target height of the presented view.
        /// If the size of the of the presented view could not be computed, meaning its equal to zero, we default to the maximum height.
        let targetHeight = presentedViewHeight == .zero ? maximumHeight : presentedViewHeight
        /// Adjust the height of the view by adding the bottom safe area inset.
        let adjustedHeight = min(targetHeight, maximumHeight) + containerView.safeAreaInsets.bottom
        
        let targetSize = CGSize(width: containerView.frame.width, height: adjustedHeight)
        let targetOrigin = CGPoint(x: .zero, y: containerView.frame.maxY - targetSize.height)
        
        return CGRect(origin: targetOrigin, size: targetSize)
    }

}
final class TDSheetTransitioningDelegate: NSObject {

}

extension TDSheetTransitioningDelegate: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return TDSheetPresentationControlelr(presentedViewController: presented, presenting: presenting)
    }
}