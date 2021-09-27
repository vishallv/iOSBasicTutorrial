//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class FirstViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Goto Second VC", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
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
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc
    private func handleButtonTap() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: false)
    }
}
