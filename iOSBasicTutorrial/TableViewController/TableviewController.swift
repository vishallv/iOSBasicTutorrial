//Copyright © 2021 iOSBasicTutorial

import UIKit
import SnapKit


struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

final class TableViewController: UIViewController{
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tableView.register(
            UserTableViewCell.self,
            forCellReuseIdentifier: UserTableViewCell.reuseIdentifier
        )

        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) {
            do {
                let data = Data(usersData.utf8)
                let users = try JSONDecoder().decode([User].self, from: data)
                self.users = users
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension NSObject {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserTableViewCell.reuseIdentifier,
                for: indexPath
        ) as? UserTableViewCell else {
            fatalError("Error dequeing cell")
        }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}

class UserTableViewCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()

    let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(emailLabel)

        containerView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview().offset(-5)
        }

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview().offset(-5)
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.lessThanOrEqualToSuperview().offset(-5)
        }
    }

    func configure(user: User) {
        nameLabel.text = user.name
        usernameLabel.text = "@\(user.username)"
        emailLabel.text = user.email
    }
}
