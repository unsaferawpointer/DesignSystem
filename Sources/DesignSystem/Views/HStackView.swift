//
//  HStackView.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import Cocoa

public class HStackView: NSView {

	private(set) var items: [any UniqueConfiguration] = []
	private(set) var views: [UniqueView] = []

	// MARK: - UI-Properties

	lazy var container: NSStackView = {
		let view = NSStackView()
		view.orientation = .horizontal
		view.distribution = .fillEqually
		return view
	}()

	// MARK: - Initialization

	public init() {
		super.init(frame: .zero)
		configureUserInterface()
	}

	@available(*, unavailable, message: "Use init()")
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Life-cycle

	public override func layout() {
		super.layout()
		print(#function)
		container.subviews.forEach { view in
			view.frame.size.height = frame.size.height
		}
	}

}

// MARK: - Helpers
private extension HStackView {

	func configureUserInterface() {
		addSubview(container)
		container.autoresizingMask = [.height, .width]
		container.frame = .init(origin: .zero, size: frame.size)
	}
}

extension HStackView {

	public func reloardItems(_ new: [any UniqueConfiguration]) {
		performAnimation(new)
	}

	func performAnimation(_ new: [any UniqueConfiguration]) {

		let old = items.map(\.id)
		let diff = new.map(\.id).difference(from: old).inferringMoves()

		self.items = new

		var moved: [AnyHashable: UniqueView] = [:]

		NSAnimationContext.runAnimationGroup({ context in
			context.duration = 0.3
			print("is main \(Thread.isMainThread)")
			for change in diff {
				switch change {
				case let .remove(oldOffset, id, newOffset):
					let view = views[oldOffset]
					if let newOffset {
						moved[id] = view
					}
					self.container.animator().removeView(view)
				case let .insert(newOffset, id, oldOffset):
					let view: NSView = {
						if let oldOffset {
							return moved[id]!
						} else {
							return items[newOffset].makeView()
						}
					}()
					view.frame.size.height = container.frame.height
					view.frame.origin.x = getOffset(for: newOffset)
					view.autoresizingMask = [.height]
					self.container.animator().insertArrangedSubview(view, at: newOffset)
				}
			}
		}, completionHandler: {

		})
	}

	func getOffset(for index: Int) -> CGFloat {
		print("newOffset = \(index)")
		let numberOfViews = container.arrangedSubviews.count
		if index == 0 {
			return 0
		} else if index == numberOfViews {
			return container.frame.width
		} else {
			return (container.arrangedSubviews[index].frame.minX + container.arrangedSubviews[index - 1].frame.maxX) / CGFloat(2)
		}
	}
}

extension NSStackView {

	func removeView(at index: Int) {
		let view = subviews[index]
		removeView(view)
	}
}
