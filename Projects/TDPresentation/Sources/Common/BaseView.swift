import UIKit
class BaseView: UIView {
    func layout() {}
    func configure() {}
    func addview() {}
    func binding() {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addview()
        self.configure()
        self.layout()
        self.binding()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
