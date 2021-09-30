//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class SwitchViewController: UIViewController {
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        return view
    }()

    private let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.thumbTintColor = .systemBlue
        toggleSwitch.onTintColor = .darkGray
        return toggleSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(contentView)
        view.addSubview(toggleSwitch)

        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(140)
        }

        toggleSwitch.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        toggleSwitch.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
    }

    @objc
    func handleSwitch() {
        contentView.isHidden = toggleSwitch.isOn
    }
}
