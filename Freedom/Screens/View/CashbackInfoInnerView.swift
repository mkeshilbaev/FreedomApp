//
//  CardGeneralInfoInnerView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 30.08.2023.
//

import UIKit
import SnapKit

final class CashbackInfoInnerView: UIView {
    // MARK: - View(s)

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "freedom_icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .white
        label.text = "0,46 FRHC"
        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupViews() {
        backgroundColor = UIColor(hex: "#4EBC73")
        
        addSubview(imageView)
        addSubview(titleLabel)

        imageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(16)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(imageView.snp.right).offset(8)
            $0.right.equalToSuperview().inset(16)
        }
    }
}
