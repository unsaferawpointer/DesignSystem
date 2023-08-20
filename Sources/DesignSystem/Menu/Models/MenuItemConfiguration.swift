//
//  MenuItemConfiguration.swift
//  
//
//  Created by Anton Cherkasov on 20.08.2023.
//

import Foundation

/// Menu item configuration
public struct MenuItemConfiguration {

	/// Menu title
	public let title: String

	/// Menu icon
	public let iconName: String?

	/// Key equivalent
	public let keyEquivalent: String

	/// Action
	public let action: (() -> Void)?

	// MARK: - Initialization

	/// Basic initialization
	///
	/// - Parameters:
	///    - title: Menu item title
	///    - iconName: Menu item icon
	///    - keyEquivalent: Key equivalent
	///    - action: Action by click
	public init(
		title: String,
		iconName: String? = nil,
		keyEquivalent: String = "",
		action: (() -> Void)? = nil
	) {
		self.title = title
		self.iconName = iconName
		self.keyEquivalent = keyEquivalent
		self.action = action
	}
}

// MARK: - Equatable
extension MenuItemConfiguration: Equatable {

	public static func == (lhs: MenuItemConfiguration, rhs: MenuItemConfiguration) -> Bool {
		return lhs.title == rhs.title
		&& lhs.iconName == rhs.iconName
		&& lhs.keyEquivalent == rhs.keyEquivalent
	}
}
