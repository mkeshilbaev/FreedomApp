//
//  CreditLimitCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 27.08.2023.
//

import UIKit

final class CreditLimitCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hex: "#636366")
        return label
    }()

    private lazy var verticalStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        vStack.axis = .vertical
        vStack.spacing = 2
        return vStack
    }()

    private let revealButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "stroke"), for: .normal)
        return button
    }()

    private let progressBarView = UIView()

    private let containerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
        setupMockData()
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

    private func setupMockData() {
        titleLabel.text = "Кредитный лимит"
        subtitleLabel.text = "Доступно 138 379,95 ₸ из 300 000 ₸"
    }

    private func setupView() {
        backgroundColor = .clear
        
        [
            verticalStackView,
            revealButton,
            progressBarView
        ].forEach {
            containerView.addSubview($0)
        }

        contentView.addSubview(containerView)

        containerView.layer.cornerRadius = 16
        containerView.backgroundColor = .white

        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        verticalStackView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
        }

        revealButton.snp.makeConstraints {
            $0.centerY.equalTo(verticalStackView)
            $0.right.equalToSuperview().inset(16)
        }

        progressBarView.snp.makeConstraints {
            $0.top.equalTo(verticalStackView.snp.bottom).offset(16)
            $0.height.equalTo(6)
            $0.left.equalToSuperview().offset(16)
            $0.right.bottom.equalToSuperview().inset(16)
        }

        progressBarView.layer.cornerRadius = 3
        progressBarView.backgroundColor = UIColor(red: 0.02, green: 0.631, blue: 0.945, alpha: 1)
    }
}
