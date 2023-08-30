//
//  MainPageModel.swift
//  Freedom
//
//  Created by Madi Keshilbayev on 30.08.2023.
//

import Foundation
import UIKit

enum ProductType {
    case replenish
    case transfer
    case payment
    case calendar
}

struct Transaction {
    let icon: UIImage
    let title: String
    let action: String
    let amount: String
    let amountSource: String
}

enum Settings {
    case blockCard(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case setAsMainCard(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case setLimits(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case changePassword(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case orderPlasticCard(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case closeCard(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
}

enum Details {
    case statement(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case creditTerms(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
    case loanAgreement(icon: UIImage, title: String, subtitle: String?, isSwitchButton: Bool)
}
