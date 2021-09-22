//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class AlertViewController: UIViewController {
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        return view
    }()

    let showAlertbutton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Show Alert", for: .normal)
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

        view.addSubview(contentView)
        view.addSubview(showAlertbutton)

        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(120)
        }

        showAlertbutton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        showAlertbutton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc
    private func handleButtonTap() {
        showAlert(preferredStyle: .actionSheet) { [weak self] hideContentView in
            self?.contentView.isHidden = hideContentView
        }
    }

    private func showAlert(
        preferredStyle: UIAlertController.Style,
        completion: @escaping(Bool) -> Void
    ) {
        let alertController = UIAlertController(
            title: "Display Conternt View",
            message: "Would you to unhide content view?",
            preferredStyle: preferredStyle
        )

        alertController.addAction(
            UIAlertAction(title: "Unhide", style: .default, handler: { _ in
                completion(false)
            })
        )

        alertController.addAction(
            UIAlertAction(title: "Hide", style: .destructive, handler: { _ in
                completion(true)
            })
        )
        present(alertController, animated: true, completion: nil)
    }
}
