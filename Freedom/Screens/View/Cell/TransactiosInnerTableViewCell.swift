//
//  TransactiosInnerTableViewCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 28.08.2023.
//

import UIKit

final class TransactiosInnerTableViewCell: UITableViewCell {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = UIColor(hex: "#636366")
        return label
    }()

    private lazy var firstVStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        vStack.axis = .vertical
        vStack.spacing = 0
        return vStack
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()

    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = UIColor(hex: "#636366")
        label.textAlignment = .right
        return label
    }()

    private lazy var secondVStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [amountLabel, sourceLabel])
        vStack.axis = .vertical
        vStack.spacing = 0
        return vStack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: Transaction) {
        iconImageView.image = item.icon
        titleLabel.text = item.title
        subTitleLabel.text = item.action
        amountLabel.text = item.amount
        sourceLabel.text = item.amountSource
    }

    private func setupViews() {
        backgroundColor = .clear
        contentView.layer.cornerRadius = 12

        [
            iconImageView,
            firstVStackView,
            secondVStackView
        ].forEach {
            contentView.addSubview($0)
        }

        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }

        firstVStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(amountLabel.snp.left).inset(12)
            $0.bottom.equalToSuperview().inset(16)
        }

        secondVStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.bottom.right.equalToSuperview().inset(16)
        }
    }
}
