//
//  PickerButton.swift
//  toduck
//
//  Created by 박효준 on 8/17/24.
//

import UIKit

final class PickerButton: UIButton {
    private var datePicker: UIDatePicker!
    
    init(type: CalendarType) {
        super.init(frame: .zero)
        
        switch type {
        case .toduck, .diary:
            self.setImage(TDImage.Direction.rightMedium, for: .normal)
        case .sheet:
            self.setImage(TDImage.Direction.rightSmall, for: .normal)
        }
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
    }
    
    // [임시코드] UIDatePicker가 아닌, UIPickerView로 커스텀해야 할듯
    // datePicker.datePickerMode = .yearAndMonth 옵션이 iOS 17.4 이상부터 가능함
    @objc private func showDatePicker() {
        let alert = UIAlertController(title: "원하는 년/월을 선택해주세요", message: "\n\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: 0, y: 50, width: alert.view.bounds.width, height: 250)
        datePicker.locale = Locale(identifier: "ko_KR") // 한국어로 설정
        
        alert.view.addSubview(datePicker)
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            let selectedDate = self.datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월"
            let dateString = dateFormatter.string(from: selectedDate)
            print("Selected Date: \(dateString)")
            // 필요한 작업 수행
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)
        
        if let topVC = UIApplication.shared.windows.first?.rootViewController {
            topVC.present(alert, animated: true, completion: nil)
        }
    }
}
