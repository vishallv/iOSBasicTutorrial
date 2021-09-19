//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit

struct User: Codable {
    let name: String
    let email: String
    let username: String
}

final class CollectionViewController: UIViewController {
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UserCollectionViewCell.self,
            forCellWithReuseIdentifier: UserCollectionViewCell.reuseIdentifier
        )
        setupUI()
        collectionView.delegate = self
        collectionView.dataSource = self

        do {
            let data = Data(usersData.utf8)
            self.users = try JSONDecoder().decode([User].self, from: data)
            collectionView.reloadData()
        } catch  {
            print(error.localizedDescription)
        }
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(220)
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuseIdentifier, for: indexPath) as? UserCollectionViewCell else {
            fatalError("Error dequeueing Cell")
        }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

extension NSObject {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

final class UserCollectionViewCell: UICollectionViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        return view
    }()


    private let nameLabel: UILabel = {
        return UILabel.createLabel(
            title: "",
            font: UIFont.systemFont(ofSize: 15),
            color: UIColor.black
        )
    }()

    private let usernameLabel: UILabel = {
        return UILabel.createLabel(
            title: "",
            font: UIFont.systemFont(ofSize: 13),
            color: UIColor.black
        )
    }()

    private let emailLabel: UILabel = {
        return UILabel.createLabel(
            title: "",
            font: UIFont.systemFont(ofSize: 14),
            color: UIColor.black
        )
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(emailLabel)
        containerView.addSubview(usernameLabel)


        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }

        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.equalTo(usernameLabel.snp.top).offset(-10)
        }

        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview()
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
        }
    }

    func configure(user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        usernameLabel.text = "@\(user.username)"
    }
}

extension UILabel {
    static func createLabel(
        title: String,
        font: UIFont,
        color: UIColor,
        textAlignment: NSTextAlignment = .left
    ) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.textAlignment = textAlignment
        label.font = font
        return label
    }
}
