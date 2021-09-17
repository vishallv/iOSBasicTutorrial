//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class ButtonViewController: UIViewController {
    private let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.isHidden = true
        return view
    }()

    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "swift_logo"), for: .normal)
        button.clipsToBounds = true
        return button
    }()

    private var isCustomViewHidden = true

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(customView)

        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }

        customView.snp.makeConstraints { make in
            make.bottom.equalTo(button.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }

        button.layer.cornerRadius = 25
        customView.layer.cornerRadius = 20

        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    @objc
    private func handleTap() {
        isCustomViewHidden = !isCustomViewHidden
        customView.isHidden = isCustomViewHidden
    }
}
