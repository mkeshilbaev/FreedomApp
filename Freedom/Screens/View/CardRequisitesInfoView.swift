//
//  CardRequisitesInfoView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 30.08.2023.
//

import UIKit
import SnapKit

final class CardRequisitesInfoView: UIView {
    // MARK: - View(s)

    private let productIconImageView = UIImageView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textColor = UIColor(hex: "#636366")
        return label
    }()

    private lazy var vStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        vStack.axis = .vertical
        vStack.spacing = 2
        return vStack
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupMockData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupMockData() {
        titleLabel.text = "Реквизиты карты"
        subtitleLabel.text = "4400 ** 3097"
        productIconImageView.image = UIImage(named: "card")
    }

    private func setupViews() {
        addSubview(productIconImageView)
        addSubview(vStackView)

        productIconImageView.layer.cornerRadius = 12

        productIconImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
            $0.height.equalTo(32)
        }

        vStackView.snp.makeConstraints {
            $0.top.equalTo(productIconImageView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.right.equalToSuperview().inset(16)
        }
    }
}
