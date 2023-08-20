//
//  MenuItem.swift
//  
//
//  Created by Anton Cherkasov on 20.08.2023.
//

import Foundation

public enum MenuItem: Equatable {
	case menu(_ title: String, items: [MenuItem])
	case menuItem(_ configuration: MenuItemConfiguration)
	case divider
}
