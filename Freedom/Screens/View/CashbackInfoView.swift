//
//  CardGeneralInfoView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 27.08.2023.
//

import UIKit
import SnapKit

final class CashbackInfoView: UIView {
    // MARK: - View(s)

    private let productView = CashbackInfoInnerView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let additionalIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()

    private lazy var hStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [titleLabel, additionalIconImageView])
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fillProportionally
        hStack.spacing = 2
        return hStack
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textColor = UIColor(hex: "#636366")
        return label
    }()

    private lazy var vStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [hStackView, subtitleLabel])
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
        titleLabel.text = "12 000,47 ₸"
        subtitleLabel.text = "Накоплено кешбэка"
    }

    private func setupViews() {
        addSubview(productView)
        addSubview(vStackView)

        productView.layer.cornerRadius = 12

        productView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
            $0.height.equalTo(32)
        }

        vStackView.snp.makeConstraints {
            $0.top.equalTo(productView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.right.equalToSuperview().inset(16)
        }

        additionalIconImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
    }
}
