//
//  TableViewHeaderView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 28.08.2023.
//

import UIKit
import SnapKit

final class TableViewHeaderView: UIView {
    // MARK: - View(s)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .gray
        return label
    }()

    private lazy var revealButton: UIButton = {
        let button = UIButton()
        button.setTitle("Все", for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(UIColor(hex: "#4EBC73"), for: .normal)
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(title: String, isButtonHidden: Bool) {
        titleLabel.text = title
        revealButton.isHidden = isButtonHidden
    }

    // MARK: - Setup

    private func setupViews() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(revealButton)

        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }

        revealButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
    }
}
