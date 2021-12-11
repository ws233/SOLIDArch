//
//  FirstTableViewFactoryProtocol.swift
//  SOLIDArch_Example
//
//  Created by Churyanin NG on 03.12.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

typealias FirstTableViewFactoryProtocol = FirstDataSourceFactoryProtocol & FirstDelegateFactoryProtocol

protocol FirstDataSourceFactoryProtocol {

    func makePlainListDataSource() -> UITableViewDataSource?
    func makeSectionDevidedDataSource() -> UITableViewDataSource?
}

protocol FirstDelegateFactoryProtocol {

    func makePlainListDelegate() -> UITableViewDelegate
    func makeSectionDevidedDelegate() -> UITableViewDelegate
}
