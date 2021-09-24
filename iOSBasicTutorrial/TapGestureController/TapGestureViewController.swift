//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

final class TapGestureViewController: UIViewController {
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 10
        return view
    }()

    private var contentViewHidden = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }

//        let tapGesture = UITapGestureRecognizer()
//        tapGesture.numberOfTapsRequired = 1
//
//        tapGesture.addTarget(self, action: #selector(handleTap))
//        view.addGestureRecognizer(tapGesture)

        let longGesture = UILongPressGestureRecognizer()
        longGesture.minimumPressDuration = 2
        longGesture.addTarget(self, action: #selector(handleTap(gesture:)))
        view.addGestureRecognizer(longGesture)
    }

    @objc
    private func handleTap(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .ended:
            contentViewHidden = !contentViewHidden
            contentView.isHidden = contentViewHidden

        default:
            break

        }
    }
}
