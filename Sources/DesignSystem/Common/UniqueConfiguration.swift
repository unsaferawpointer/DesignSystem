//
//  UniqueConfiguration.swift
//  
//
//  Created by Anton Cherkasov on 13.08.2023.
//

import Foundation

public protocol UniqueConfiguration: ViewConfiguration {

	var id: AnyHashable { get }
}
