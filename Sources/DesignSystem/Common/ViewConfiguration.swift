//
//  ViewConfiguration.swift
//  
//
//  Created by Anton Cherkasov on 12.08.2023.
//

import Cocoa

/// View-model configuration interface
public protocol ViewConfiguration: Equatable {

	associatedtype View: ConfigurableView where View.Configuration == Self

}

// MARK: - methods by-default
extension ViewConfiguration {

	/// Make field based on this configuration
	func makeField() -> NSView {
		return View(self)
	}
}

