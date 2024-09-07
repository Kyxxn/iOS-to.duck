import SnapKit
import UIKit

class TDPopupViewController<LayerView: BaseView>: BaseViewController<BaseView>, UIGestureRecognizerDelegate {
    let layerView = LayerView()
    override func configure() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        tapGesture.delegate = self
        layoutView.addGestureRecognizer(tapGesture)
        layoutView.isUserInteractionEnabled = true
        layoutView.backgroundColor = .black.withAlphaComponent(0.5)

        //layerView.backgroundColor = .white
    }

    override func addView() {
        layoutView.addSubview(layerView)
    }

    override func layout() {
        layerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    @objc func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}
