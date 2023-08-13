//
//  UniqueView.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import Cocoa

public class UniqueView: NSView, Identifiable {

	public var id: AnyHashable

	// MARK: - Initialization

	init(
		id: AnyHashable,
		frame: NSRect = .zero
	) {
		self.id = id
		super.init(frame: frame)
	}

	@available(*, unavailable, message: "Use init(id: frame:)")
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
