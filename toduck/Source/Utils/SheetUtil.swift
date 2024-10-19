//
//  SheetUtil.swift
//  toduck
//
//  Created by 박효준 on 8/4/24.
//

import UIKit

struct SheetUtil {
    /// ViewController가 갖는 view의 높이를 계산하는데 사용됨
    static func calculateHeight(for viewController: UIViewController) -> CGFloat {
        viewController.view.layoutIfNeeded()
        let fittingSize = CGSize(width: viewController.view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        return viewController.view.systemLayoutSizeFitting(
            fittingSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        ).height
    }


}
