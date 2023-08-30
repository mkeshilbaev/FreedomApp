//
//  SettingsCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

final class SettingsCell: UITableViewCell {
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

    private let items: [Settings] = [
        .blockCard(icon: UIImage(named: "block_icon")!,
                   title: "Заблокировать",
                   subtitle: nil,
                   isSwitchButton: true),
        .setAsMainCard(icon: UIImage(named: "main_card_icon")!,
                       title: "Основная карта",
                       subtitle: "Для переводов по номеру телефона",
                       isSwitchButton: true),
        .setLimits(icon: UIImage(named: "limit_icon")!,
                       title: "Лимиты",
                       subtitle: nil,
                       isSwitchButton: false),
        .changePassword(icon: UIImage(named: "change_pin_icon")!,
                       title: "Изменить ПИН-код",
                       subtitle: nil,
                       isSwitchButton: false),
        .orderPlasticCard(icon: UIImage(named: "order_card_icon")!,
                       title: "Заказать пластиковую карту",
                       subtitle: nil,
                       isSwitchButton: false),
        .closeCard(icon: UIImage(named: "close_card_icon")!,
                       title: "Закрыть карту",
                       subtitle: nil,
                       isSwitchButton: false),
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

extension SettingsCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsInnerTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        let item = items[indexPath.row]

        switch item {
        case .blockCard(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .setAsMainCard(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .setLimits(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .changePassword(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .orderPlasticCard(let icon, let title, let subtitle, let isSwitchButton):
            cell.configure(icon, title, subtitle)

            if isSwitchButton {
                cell.configureEditButton(isSwitch: true)
                cell.accessoryView = UISwitch()
            } else {
                cell.configureEditButton(isSwitch: false)
            }

            cell.selectionStyle = .none

            return cell
        case .closeCard(let icon, let title, let subtitle, let isSwitchButton):
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
        headerView.configureView(title: "Настройки", isButtonHidden: true)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        36
    }
}
