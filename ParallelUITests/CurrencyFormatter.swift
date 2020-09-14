//
//  CurrencyFormatter.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/14/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation

/// An app global currency formatter instance.
let sharedCurrencyFormatter = CurrencyFormatter()

/**
 A USD currency formatter.
 
 ```
 $100,000.00
 ```
 */
class CurrencyFormatter: NumberFormatter {
    override init() {
        super.init()
        numberStyle = .currency
        currencyCode = "USD"
        currencySymbol = "$"
        decimalSeparator = "."
        currencyGroupingSeparator = ","
        groupingSize = 3
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
