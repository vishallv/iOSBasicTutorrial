//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class FirstViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Hello World"
        return label
    }()

    private let passButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Goto second VC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(passButton)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        passButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        passButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc
    private func  handleButtonTap() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func passDataBackToVC(text: String?) {
        navigationController?.popViewController(animated: true)
        label.text = text
    }
}
