import UIKit

protocol TDPopupPresentable {
    // popup을 띄우는 함수입니다
    func presentPopup<T: BaseView>(with vc: TDPopupViewController<T>)
}

extension TDPopupPresentable where Self: UIViewController {
    func presentPopup<T: BaseView>(with viewController: TDPopupViewController<T>) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }
}
