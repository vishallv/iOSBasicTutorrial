//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class LabelViewController: UIViewController {
    let appLabel: UILabel = {
        let label =  UILabel.createLabel(
            title: "hello world hello world hello world hello world hello world hello world hello world hello world hello",
            font: UIFont.systemFont(ofSize: 25),
            color: .black
        )
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appLabel)
        view.backgroundColor = .white
        appLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}

extension UILabel {
    static func createLabel(
        title: String,
        font: UIFont,
        color: UIColor,
        alignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        return label
    }
}
