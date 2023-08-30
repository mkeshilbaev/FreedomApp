//
//  DebtInfoView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 27.08.2023.
//

import UIKit
import SnapKit

final class DebtInfoView: UIView {
    // MARK: - UI components

    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#4EBC73")
        button.layer.cornerRadius = 16
        return button
    }()

    private let buttonTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.text = "Погасить"
        return label
    }()

    private let dueDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)
        return label
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
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

    // MARK: - Private methods

    private func setupMockData() {
        dueDateLabel.text = "Внесите платеж до 20 сентября"
        amountLabel.text = "15 000 ₸"
    }

    private func setupViews() {
        addSubview(payButton)
        addSubview(dueDateLabel)
        addSubview(amountLabel)

        dueDateLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
        }

        amountLabel.snp.makeConstraints {
            $0.top.equalTo(dueDateLabel.snp.bottom)
            $0.left.equalTo(dueDateLabel)
            $0.bottom.equalToSuperview().inset(16)
        }

        payButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(32)
            $0.right.equalToSuperview().inset(16)
            $0.left.equalTo(dueDateLabel.snp.right).offset(16)
        }

        payButton.addSubview(buttonTextLabel)

        buttonTextLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
}
