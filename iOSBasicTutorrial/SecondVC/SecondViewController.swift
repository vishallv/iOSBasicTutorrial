//Copyright © 2021 iOSBasicTutorial

import UIKit

protocol SecondViewModule {
    typealias FinishBlock = (String?) -> Void
    var onButtonTap: FinishBlock? { get set }
}

final class SecondViewController: UIViewController,
                                  SecondViewModule {

    var onButtonTap: FinishBlock?
    private let textfield: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.placeholder = "Type Here"
        tf.backgroundColor = .white
        return tf
    }()

    private let passButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Pass text to First VC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemPink

        view.addSubview(textfield)
        view.addSubview(passButton)

        textfield.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }

        passButton.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        passButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc
    func handleButtonTap() {
        let text = textfield.text
        onButtonTap?(text)
    }
}
