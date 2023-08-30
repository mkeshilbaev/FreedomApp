//
//  SettingsInnerTableViewCell.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 29.08.2023.
//

import UIKit

final class SettingsInnerTableViewCell: UITableViewCell {
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
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex: "#636366")
        return label
    }()

    private var editButton: UIButton = {
        let button = UIButton()
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    func configure(_ iconImage: UIImage,
                   _ title: String,
                   _ subtitle: String?) {
        iconImageView.image = iconImage
        titleLabel.text = title

        if let subtitle = subtitle {
            subTitleLabel.text = subtitle
            subTitleLabel.isHidden = false
            remakeConstraints()
        } else {
            subTitleLabel.isHidden = true
        }
    }

    func configureEditButton(isSwitch: Bool) {
        if isSwitch {
            editButton.isHidden = true
        } else {
            editButton.isHidden = false
            editButton.setImage(UIImage(named: "stroke"), for: .normal)
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .clear

        [
            iconImageView,
            titleLabel,
            subTitleLabel,
            editButton
        ].forEach {
            contentView.addSubview($0)
        }

        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(editButton.snp.left).offset(-16)
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(editButton.snp.left).inset(8)
            $0.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(0)
        }

        editButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
    }

    private func remakeConstraints() {
        subTitleLabel.snp.remakeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(editButton.snp.left).inset(8)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
