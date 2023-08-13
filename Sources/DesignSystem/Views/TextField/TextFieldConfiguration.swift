//
//  TextFieldConfiguration.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import AppKit

public struct TextFieldConfiguration: ViewConfiguration {

	public typealias View = TextField

	public var title: String

	public var style: TextStyle

	public var isEditable: Bool

	public var action: ((String) -> Void)?

	// MARK: - Initialization

	public init(
		title: String = "",
		style: TextStyle = .plain(.body),
		isEditable: Bool = false,
		action: ((String) -> Void)? = nil
	) {
		self.title = title
		self.style = style
		self.isEditable = isEditable
		self.action = action
	}
}

// MARK: - Equatable
extension TextFieldConfiguration: Equatable {

	public static func == (lhs: TextFieldConfiguration, rhs: TextFieldConfiguration) -> Bool {
		return lhs.title == rhs.title
		&& lhs.style == rhs.style
		&& lhs.isEditable == rhs.isEditable
	}
}

// MARK: - Default configuration
extension TextFieldConfiguration {

	public static var label: TextFieldConfiguration {
		return TextFieldConfiguration(isEditable: false)
	}

	public static var textfield: TextFieldConfiguration {
		return TextFieldConfiguration(isEditable: true)
	}
}
