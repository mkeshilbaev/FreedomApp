//
//  UITableView+Extension.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 27.08.2023.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath)
                as? T else { fatalError(" table view cell identifier does not exist") }
        return cell
    }
}
