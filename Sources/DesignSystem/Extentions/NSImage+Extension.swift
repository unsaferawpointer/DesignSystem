//
//  NSImage+Extension.swift
//  
//
//  Created by Anton Cherkasov on 20.08.2023.
//

import Cocoa

extension NSImage {

	convenience init?(systemSymbolName: String?) {
		guard let name = systemSymbolName else {
			return nil
		}
		self.init(
			systemSymbolName: name,
			accessibilityDescription: nil
		)
	}

}
