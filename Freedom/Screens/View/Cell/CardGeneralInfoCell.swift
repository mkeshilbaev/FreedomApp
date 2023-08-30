//
//  CardGeneralInfoCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 27.08.2023.
//

import UIKit

final class CardGeneralInfoCell: UITableViewCell {
    private let cashbackInfoView = CashbackInfoView()
    private let cardRequisitesInfoView = CardRequisitesInfoView()

    private lazy var horizontalStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [cashbackInfoView, cardRequisitesInfoView])
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.alignment = .center
        hStack.spacing = 16
        return hStack
    }()

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

    private func setupView() {
        backgroundColor = .clear

        contentView.addSubview(horizontalStackView)

        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.layer.cornerRadius = 12

        cashbackInfoView.backgroundColor = .white
        cashbackInfoView.layer.cornerRadius = 12

        cardRequisitesInfoView.backgroundColor = .white
        cardRequisitesInfoView.layer.cornerRadius = 12

        cashbackInfoView.snp.makeConstraints {
            $0.width.equalTo(171)
        }
    }
}
