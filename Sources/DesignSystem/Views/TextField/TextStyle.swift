//
//  TextStyle.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import Cocoa

public enum TextStyle: Equatable {

	/// Plain field
	case plain(_ font: NSFont.TextStyle)

	/// Rounded field
	case rounded(_ font: NSFont.TextStyle)
}

// MARK: - Calculated properties
extension TextStyle {

	var isBezeled: Bool {
		switch self {
		case .plain:
			return false
		case .rounded:
			return true
		}
	}

	var drawBackground: Bool {
		switch self {
		case .plain:
			return false
		case .rounded:
			return true
		}
	}

	var font: NSFont {
		switch self {
		case .plain(let style):
			return NSFont.preferredFont(forTextStyle: style)
		case .rounded(let style):
			return NSFont.preferredFont(forTextStyle: style)
		}
	}
}
