import UIKit
import SnapKit

protocol DropDownDelegate: AnyObject {
    func dropDown(_ dropDownView: TDDropdownView, didSelectRowAt indexPath: IndexPath)
}

final class TDDropdownView: UIView {
    private let containerView = UIView()
    private let dropDownTableView = DropDownTableView()
    
    private enum DropDownMode {
        case display
        case hide
    }
    
    enum LocateLayout {
        case leading
        case trailing
    }
    
    weak var delegate: DropDownDelegate?
    
    private var dropDownConstraints: ((ConstraintMaker) -> Void)?
    private var dropDownMode: DropDownMode = .hide
    private var locate: LocateLayout = .leading
    var dataSource = [String]() {
        didSet { dropDownTableView.reloadData() }
    }
    
    private(set) var selectedOption: String?
    private var width: CGFloat = 0
    override var canBecomeFirstResponder: Bool { true }
    
    private let anchorView: UIView
    
    init(anchorView: UIView) {
        self.anchorView = anchorView
        super.init(frame: .zero)
        
        dropDownTableView.dataSource = self
        dropDownTableView.delegate = self
        
        setupUI()
    }
    
    convenience init(anchorView: UIView, selectedOption: String, layout: LocateLayout, width: CGFloat) {
        self.init(anchorView: anchorView)
        self.selectedOption = selectedOption
        self.locate = layout
        self.width = width
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dropDownMode == .display {
            resignFirstResponder()
        } else {
            becomeFirstResponder()
        }
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        dropDownMode = .display
        displayDropDown(with: dropDownConstraints)
        return true
    }
    
    @discardableResult
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        dropDownMode = .hide
        hideDropDown()
        return true
    }
}

private extension TDDropdownView {
    func setupUI() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .clear
        containerView.addSubview(dropDownTableView)
        
        dropDownTableView.layer.cornerRadius = 8
        dropDownTableView.layer.masksToBounds = true
        dropDownTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(anchorView)
        
        anchorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        if locate == .leading {
            setConstraints {
                $0.leading.equalTo(self.anchorView)
                $0.width.equalTo(self.width)
                $0.top.equalTo(self.anchorView.snp.bottom)
            }
        } else if locate == .trailing {
            setConstraints {
                $0.trailing.equalTo(self.anchorView)
                $0.width.equalTo(self.width)
                $0.top.equalTo(self.anchorView.snp.bottom)
            }
        }
    }
}

// MARK: - DropDown Logic
extension TDDropdownView {
    func displayDropDown(with constraints: ((ConstraintMaker) -> Void)?) {
        guard let constraints = constraints else { return }
        window?.addSubview(containerView)
        containerView.snp.makeConstraints(constraints)
    }
    
    func hideDropDown() {
        containerView.removeFromSuperview()
    }
    
    func setConstraints(_ closure: @escaping (_ make: ConstraintMaker) -> Void) {
        self.dropDownConstraints = closure
    }
}

// MARK: - UITableViewDataSource
extension TDDropdownView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DropDownCell.identifier,
            for: indexPath
        ) as? DropDownCell else {
            return UITableViewCell()
        }
        
        if let selectedOption = self.selectedOption, selectedOption == dataSource[indexPath.row] {
            cell.isSelected = true
        }
        
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TDDropdownView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOption = dataSource[indexPath.row]
        delegate?.dropDown(self, didSelectRowAt: indexPath)
        dropDownTableView.selectRow(at: indexPath)
        resignFirstResponder()
    }
}
