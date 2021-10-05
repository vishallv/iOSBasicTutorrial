//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class SegmentVieController: UIViewController {
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: items)
        segment.backgroundColor = .darkGray
        segment.selectedSegmentTintColor = .systemBlue
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        return segment
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let items = ["First", "Second", "Third"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentControl.selectedSegmentIndex = 0
    }

    private func  setupUI() {
        view.backgroundColor = .white
        view.addSubview(segmentControl)
        view.addSubview(label)

        segmentControl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        segmentControl.addTarget(self, action: #selector(handleSegmentChanged(segment:)), for: .valueChanged)

        label.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    @objc
    func handleSegmentChanged(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        guard index < items.count else { return }
        label.text = items[index]
    }
}
