//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class BaseViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Present VC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(140)
            make.height.equalTo(40)
        }

        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc
    func handleButtonTap() {
        let presentVC = PresentViewController()
        presentVC.modalPresentationStyle = .fullScreen
        presentVC.modalTransitionStyle = .crossDissolve
        present(presentVC, animated: true, completion: nil)
    }
}
