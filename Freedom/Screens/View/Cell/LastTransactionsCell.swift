//
//  LastTransactionsCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 28.08.2023.
//

import UIKit
import SnapKit

final class LastTransactionsCell: UITableViewCell {
    private let headerView = TableViewHeaderView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.isScrollEnabled = false
        tableView.register(TransactiosInnerTableViewCell.self,
                           forCellReuseIdentifier: "\(TransactiosInnerTableViewCell.self)")
        return tableView
    }()

    private let items: [Transaction] = [
        .init(icon: UIImage(named: "transaction_icon")!, title: "Мама", action: "Перевод", amount: "-1 500,00 ₸", amountSource: "Freepay Card · Займ"),
        .init(icon: UIImage(named: "magnum")!, title: "Magnum", action: "Покупка", amount: "-2 000,00 ₸", amountSource: "Freepay Card · Займ"),
        .init(icon: UIImage(named: "starbucks")!, title: "Starbucks", action: "Покупка", amount: "-6 995,00 ₸", amountSource: "Freepay Card · Займ")
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

extension LastTransactionsCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TransactiosInnerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableViewHeaderView()
        headerView.configureView(title: "Последние операции", isButtonHidden: false)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        36
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        67
    }
}
