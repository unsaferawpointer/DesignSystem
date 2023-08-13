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

	/// Make view based on this configuration
	func makeView() -> NSView {
		return View(self)
	}
}

