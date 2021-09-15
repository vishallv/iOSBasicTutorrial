//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class ImageViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swift_logo")
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageView.layer.cornerRadius = imageView.bounds.height * 0.5
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }
    }
}
