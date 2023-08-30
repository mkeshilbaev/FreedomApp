//
//  HeaderView.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 26.08.2023.
//

import UIKit
import SnapKit

final class HeaderView: UIView {
    // MARK: - UI components

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()

    private let cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    private let editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "edit")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var horizontalStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [cardNameLabel, editImageView])
        hStack.axis = .horizontal
        hStack.distribution = .fill
        hStack.alignment = .center
        hStack.spacing = 2
        return hStack
    }()

    private let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let amountSourceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()

    private let inProcessingAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()

    private lazy var verticalStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [totalAmountLabel,
                                                    amountSourceLabel,
                                                    inProcessingAmountLabel])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 8
        return vStack
    }()

    private lazy var quickActionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(BannerCollectionCell.self,
                            forCellWithReuseIdentifier: "\(BannerCollectionCell.self)")

        return collection
    }()

    private let cardDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "Цифровая кредитная карта"
        return label
    }()

    private let applePayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple_pay_icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var hStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [cardDescriptionLabel, applePayImageView])
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.spacing = 8
        return hStack
    }()

    private let contentView = UIView()

    private let debtInfoView = DebtInfoView()

    // MARK: - Properties

    private let products: [ProductType] = [.replenish, .transfer, .payment, .calendar]

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
        cardNameLabel.text = "Freepay Card"

        let amount = NSMutableAttributedString(
            string: "118 379",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .bold)]
        )

        let fraction = NSMutableAttributedString(
            string: ",95 ₸",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),
                         NSAttributedString.Key.foregroundColor: UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)]
        )

        amount.append(fraction)
        totalAmountLabel.attributedText = amount


        let ownAmountKey = NSMutableAttributedString(
            string: "Мои средства:",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium),
                         NSAttributedString.Key.foregroundColor: UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)]
        )

        let ownAmountValue = NSMutableAttributedString(
            string: " 0 ₸",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)]
        )

        let creditAmountKey = NSMutableAttributedString(
            string: " | Кредитные:",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium),
                         NSAttributedString.Key.foregroundColor: UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)]
        )

        let creditAmountValue = NSMutableAttributedString(
            string: " 138 379,95 ₸",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)]
        )

        ownAmountKey.append(ownAmountValue)
        creditAmountKey.append(creditAmountValue)
        ownAmountKey.append(creditAmountKey)
        amountSourceLabel.attributedText = ownAmountKey

        let inProcessingAmountKey = NSMutableAttributedString(
            string: "В обработке:",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium),
                         NSAttributedString.Key.foregroundColor: UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)]
        )

        let inProcessingAmountValue = NSMutableAttributedString(
            string: " 20 000",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)]
        )

        let inProcessingAmountValueFraction = NSMutableAttributedString(
            string: ",00 ₸",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium),
                         NSAttributedString.Key.foregroundColor: UIColor(hex: "#F7F7F7CC").withAlphaComponent(0.8)]
        )

        inProcessingAmountValue.append(inProcessingAmountValueFraction)
        inProcessingAmountKey.append(inProcessingAmountValue)
        inProcessingAmountLabel.attributedText = inProcessingAmountKey
    }

    private func setupViews() {
        [
            backButton,
            horizontalStackView,
            verticalStackView,
            quickActionsCollectionView,
            debtInfoView,
            hStackView
        ].forEach {
            addSubview($0)
        }

        backButton.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
            $0.size.equalTo(24)
        }

        horizontalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
        }

        editImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }

        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalStackView.snp.bottom).offset(37)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().offset(16)
        }

        quickActionsCollectionView.snp.makeConstraints {
            $0.top.equalTo(verticalStackView.snp.bottom).offset(32)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(88)
        }

        debtInfoView.snp.makeConstraints {
            $0.top.equalTo(quickActionsCollectionView.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
        }

        debtInfoView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15).cgColor
        debtInfoView.layer.cornerRadius = 16

        hStackView.snp.makeConstraints {
            $0.top.equalTo(debtInfoView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BannerCollectionCell.self)",
                                                          for: indexPath) as? BannerCollectionCell
        else {
            fatalError()
        }

        cell.setupData(productType: products[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 88)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
