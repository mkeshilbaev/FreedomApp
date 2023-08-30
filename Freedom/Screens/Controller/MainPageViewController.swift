//
//  MainPageViewController.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 26.08.2023.
//

import UIKit
import UltraDrawerView
import SnapKit

final class MainPageViewController: UIViewController {
    // MARK: - UI components

    private let headerView = HeaderView()

    private let tableHeaderView = UIView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        tableView.register(CardGeneralInfoCell.self, forCellReuseIdentifier: "\(CardGeneralInfoCell.self)")
        tableView.register(CreditLimitCell.self, forCellReuseIdentifier: "\(CreditLimitCell.self)")
        tableView.register(LastTransactionsCell.self, forCellReuseIdentifier: "\(LastTransactionsCell.self)")
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "\(SettingsCell.self)")
        tableView.register(DetailsCell.self, forCellReuseIdentifier: "\(DetailsCell.self)")
        return tableView
    }()

    private var drawerView: DrawerView!

    // MARK: - Properties

    private enum Layout {
        static let topInsetPortrait: CGFloat = 120
        static let middleInsetFromBottom: CGFloat = 360
        static let cornerRadius: CGFloat = 16
    }

    private enum HomeModule: Int {
        case creditLimit
        case cardGeneralInfo
        case lastTransactions
        case settings
        case details
    }

    private var cells: [HomeModule] = [.cardGeneralInfo, .creditLimit, .lastTransactions, .settings, .details]

    private var isFirstLayout = true

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if isFirstLayout {
            isFirstLayout = false
            updateLayoutWithCurrentOrientation()
            drawerView.setState(.middle, animated: false)
        }
    }

    // MARK: - UI methods

    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let prevState = drawerView.state

        updateLayoutWithCurrentOrientation()

        coordinator.animate(alongsideTransition: { [weak self] context in
            let newState: DrawerView.State = (prevState == .bottom) ? .bottom : .top
            self?.drawerView.setState(newState, animated: context.isAnimated)
        })
    }

    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        tableView.contentInset.bottom = view.safeAreaInsets.bottom
        tableView.verticalScrollIndicatorInsets.bottom = view.safeAreaInsets.bottom
    }

    // MARK: - Private methods

    private func setupViews() {
        view.addSubview(headerView)

        setHeaderViewGradientLayer()

        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }

        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }

        drawerView = DrawerView(scrollView: tableView, headerView: tableHeaderView)
        drawerView.middlePosition = .fromBottom(Layout.middleInsetFromBottom, ignoresSafeArea: true)
        drawerView.cornerRadius = Layout.cornerRadius
        drawerView.containerView.backgroundColor = UIColor(hex: "#EAECED")
        drawerView.setState(.middle, animated: false)

        view.addSubview(drawerView)

        drawerView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }

    private func updateLayoutWithCurrentOrientation() {
        drawerView.topPosition = .fromTop(Layout.topInsetPortrait, ignoresSafeArea: true)
        drawerView.availableStates = [.top, .middle]
    }

    private func setHeaderViewGradientLayer() {
        let layer = CAGradientLayer()

        layer.colors = [UIColor(red: 0.017, green: 0.672, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.144, green: 0.349, blue: 0.616, alpha: 1).cgColor]

        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1, b: 1, c: -1, d: -0.89, tx: 1.5, ty: 0.45))

        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.position = view.center

        headerView.layer.insertSublayer(layer, at: 0)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource methods

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeModule(rawValue: indexPath.row) else { return UITableViewCell() }

        switch section {
        case .cardGeneralInfo:
            let cell: CardGeneralInfoCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case .creditLimit:
            let cell: CreditLimitCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case .lastTransactions:
            let cell: LastTransactionsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case .settings:
            let cell: SettingsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case .details:
            let cell: DetailsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = HomeModule(rawValue: indexPath.row) else { return CGFloat() }

        switch section {
        case .cardGeneralInfo:
            return 140
        case .creditLimit:
            return 100
        case .lastTransactions:
            return 252
        case .settings:
            return 454
        case .details:
            return 256
        }
    }
}
