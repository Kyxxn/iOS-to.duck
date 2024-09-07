//
//  HomeViewController.swift
//  toduck
//
//  Created by 박효준 on 7/15/24.
//

import SnapKit
import Then
import UIKit

// TODO: 처음 시작할 때, 세그먼트 내부 뷰컨이 '토덕' 0번 인덱스가 아닌, '루틴' 2번 인덱스로 열리고 있음
// '토덕'은 원래 블루인데, 처음에 빨강으로 뜸, 다른 곳 갔다오면 블루로 보임
class HomeViewController: UIViewController, TDSheetPresentation {
    let segmentedControl = TDSegmentedController(items: ["토덕", "일정", "루틴"])

    let todoViewController = ToduckViewController()
    let scheduleViewController = ScheduleViewController()
    let routineViewController = RoutineViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        setupSegmentedControl()
        setupViewControllers()
    }

    private func setupSegmentedControl() {
        view.addSubview(segmentedControl)

        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(180)
            make.height.equalTo(43)
        }

        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    private func setupViewControllers() {
        addChild(todoViewController)
        addChild(scheduleViewController)
        addChild(routineViewController)

        view.addSubview(todoViewController.view)
        view.addSubview(scheduleViewController.view)
        view.addSubview(routineViewController.view)

        todoViewController.didMove(toParent: self)
        scheduleViewController.didMove(toParent: self)
        routineViewController.didMove(toParent: self)

        todoViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }

        scheduleViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }

        routineViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc private func segmentChanged() {
        updateView()
    }

    private func updateView() {
        todoViewController.view.isHidden = segmentedControl.selectedSegmentIndex != 0
        scheduleViewController.view.isHidden = segmentedControl.selectedSegmentIndex != 1
        routineViewController.view.isHidden = segmentedControl.selectedSegmentIndex != 2
    }
}
