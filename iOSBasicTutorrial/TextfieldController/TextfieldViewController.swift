//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class TextfieldViewController: UIViewController {
    private let appTextfield: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.backgroundColor = #colorLiteral(red: 0.8410259485, green: 1, blue: 0.9471700788, alpha: 1)
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [
                .font : UIFont.systemFont(ofSize: 18),
                .foregroundColor: UIColor.lightGray
            ]
        )
        textfield.returnKeyType = .done
        return textfield
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(appTextfield)

        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.lessThanOrEqualTo(appTextfield.snp.top).offset(-10)
        }

        appTextfield.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

        appTextfield.delegate = self
        appTextfield.addTarget(self, action: #selector(handleTextChange(textfield:)), for: .allEditingEvents)
    }

    @objc
    private func handleTextChange(textfield: UITextField) {
        guard let text = textfield.text else { return }
        label.text = text
    }
}

extension TextfieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .done {
            view.endEditing(true)
        }
        return true
    }
}
