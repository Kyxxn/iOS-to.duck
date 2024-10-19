//
//  TDSheetPresentation.swift
//  toduck
//
//  Created by 박효준 on 8/4/24.
//

import UIKit

protocol TDSheetPresentation where Self: UIViewController {
    func showSheet(with contentViewController: UIViewController)
    // 확장성: setSheetAppearance, sheetWillAppear, sheetWillDisappear 가능
}


extension TDSheetPresentation {
    typealias SheetDetent = UISheetPresentationController.Detent

    func showSheet(with contentViewController: UIViewController) {
        if let sheet = contentViewController.sheetPresentationController {
            contentViewController.view.layoutIfNeeded()
            let identifier: Self.SheetDetent.Identifier = SheetDetent.Identifier("customDetent")
            let customDetent = SheetDetent.custom(identifier: identifier) { _ in
                SheetUtil.calculateHeight(for: contentViewController)
            }
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        
        setBottomConstraint(for: contentViewController.view)
        contentViewController.view.backgroundColor = TDColor.baseWhite
        present(contentViewController, animated: true, completion: nil)
    }
    
    // MARK: 시트지에 보일 뷰 요소 중, 마지막 요소에 bottom 안전구역 지정
    private func setBottomConstraint(for view: UIView) { //이것도 문제일지도?
        
        if let lastSubview = view.subviews.last {
            let safeAreaBottomInset = view.safeAreaInsets.bottom
            lastSubview.snp.makeConstraints { make in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-safeAreaBottomInset)
            }
        }
    }
}

extension UIViewController {
    var calculatedHeight: CGFloat {
        loadViewIfNeeded()
        let targetSize = CGSize(width: view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        return view.systemLayoutSizeFitting(targetSize).height
    }
}

extension UISheetPresentationController {
    func getSheetHeight() -> CGRect {
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
