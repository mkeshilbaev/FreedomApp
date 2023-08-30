//
//  BannerCollectionCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 26.08.2023.
//

import UIKit
import SnapKit

final class BannerCollectionCell: UICollectionViewCell {
    private var productType: ProductType? {
        didSet {
            configureViews()
        }
    }

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)

        iconImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(24)
            $0.top.equalToSuperview().offset(16)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImageView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(16)
        }
    }

    func setupData(productType: ProductType) {
        self.productType = productType
    }

    private func configureViews() {
        contentView.layer.cornerRadius = 16

        switch productType {
        case .replenish:
            contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15).cgColor
            iconImageView.image = UIImage(named: "replenish_card_icon")
            titleLabel.text = "Пополнить"
        case .transfer:
            contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15).cgColor
            iconImageView.image = UIImage(named: "transfer_icon")
            titleLabel.text = "Перевод"
        case .payment:
            contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15).cgColor
            iconImageView.image = UIImage(named: "payment_icon")
            titleLabel.text = "Платеж"
        case .calendar:
            contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15).cgColor
            iconImageView.image = UIImage(named: "calendar_icon")
            titleLabel.text = "Календарь"
        case .none:
            break
        }
    }
}
