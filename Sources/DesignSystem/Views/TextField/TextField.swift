//
//  TextField.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import Cocoa

public class TextField: NSView {

	var configuration: Configuration {
		didSet {
			configure(configuration)
		}
	}

	// MARK: - UI-Properties

	private lazy var textfield: NSTextField = {
		let field = NSTextField()
		return field
	}()

	// MARK: - Initialization

	required public init(_ configuration: Configuration) {
		self.configuration = configuration
		super.init(frame: .zero)
		configure(configuration)
		configureConstraints()
		textfield.target = self
		textfield.action = #selector(fieldDidChange(_:))
		textfield.cell?.sendsActionOnEndEditing = true
	}

	@available(*, unavailable, message: "Init(style:)")
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - ConfigurableView
extension TextField: ConfigurableView {

	public typealias Configuration = TextFieldConfiguration

	public func configure(_ configuration: Configuration) {
		configure(configuration.style)
		textfield.stringValue = configuration.title
		textfield.isEditable = configuration.isEditable
	}
}

// MARK: - Helpers
private extension TextField {

	func configure(_ style: TextStyle) {
		textfield.isBezeled = style.isBezeled
		textfield.drawsBackground = style.drawBackground
		textfield.font = style.font
	}

	func configureConstraints() {
		textfield.translatesAutoresizingMaskIntoConstraints = false
		addSubview(textfield)

		NSLayoutConstraint.activate(
			[
				textfield.leadingAnchor.constraint(equalTo: leadingAnchor),
				textfield.topAnchor.constraint(equalTo: topAnchor),
				textfield.trailingAnchor.constraint(equalTo: trailingAnchor),
				textfield.bottomAnchor.constraint(equalTo: bottomAnchor)
			]
		)
	}
}

// MARK: - Actions
extension TextField {

	@objc
	func fieldDidChange(_ sender: Any) {
		configuration.action?(textfield.stringValue)
	}
}
