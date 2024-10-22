import UIKit

final class TimerViewController: BaseViewController<TimerView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let vc = TimerSettingViewController()
    
        // vc.modalPresentationStyle = .custom
        // vc.transitioningDelegate = delegate
        // present(vc, animated: true)
    }

    
}
