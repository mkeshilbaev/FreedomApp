//
//  DetailsCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 30.08.2023.
//

import UIKit
import SnapKit

final class DetailsCell: UITableViewCell {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.register(SettingsInnerTableViewCell.self,
                           forCellReuseIdentifier: "\(SettingsInnerTableViewCell.self)")
        return tableView
    }()

    private let items: [Details] = [
        .statement(icon: UIImage(named: "statement_icon")!,
                   title: "Справки",
                   subtitle: "О наличии счета и доступном остатке",
                   isSwitchButton: false),
        .creditTerms(icon: UIImage(named: "agreement_icon")!,
                     title: "Условия кредита",
                     subtitle: nil,
                     isSwitchButton: false),
        .loanAgreement(icon: UIImage(named: "agreement_icon")!,
                       title: "Договор банковского займа",
                       subtitle: nil,
                       isSwitchButton: false)
    ]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                               left: 16,
                                                                               bottom: 16,
                                                                               right: 16))
    }

    private func setupView(){
        backgroundColor = .clear

        contentView.addSubview(tableView)

        tableView.layer.cornerRadius = 16

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
}

extension DetailsCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsInnerTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        let item = items[indexPath.row]

        switch item {
        case .statement(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .creditTerms(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .loanAgreement(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        66
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableViewHeaderView()
        headerView.configureView(title: "Детали", isButtonHidden: true)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}
