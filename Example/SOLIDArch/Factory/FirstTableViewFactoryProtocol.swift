//
//  FirstTableViewFactoryProtocol.swift
//  SOLIDArch_Example
//
//  Created by Churyanin NG on 03.12.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

typealias FirstTableViewFactoryProtocol = FirstDataSourceFactoryProtocol

protocol FirstDataSourceFactoryProtocol {

    func makePlainListDataSource() -> UITableViewDataSource?
    func makeSectionDevidedDataSource() -> UITableViewDataSource?
}
