//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class ScrollViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()

    private let label1: UILabel = {
        let label = UILabel()
        label.text = "LABEL 1"
        label.textColor = .white
        label.backgroundColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.text = "LABEL 2"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor = .systemGray2
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(label1)
        contentView.addSubview(label2)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }

        label1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(600)
//            make.bottom.equalToSuperview()
        }

        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(600)
            make.bottom.equalToSuperview()
        }
    }
}
