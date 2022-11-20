//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import UIKit
import SOLIDArch

class UITableViewMock: UITableView {

	var stubbedDequeuedReusableCell: UITableViewCell!
	var stubbedDataSource: UITableViewDataSource!
	var stubbedDelegate: UITableViewDelegate!
	var stubbedCell: UITableViewCell!
	
	private(set) var reloadDataCalled = false

	override var dataSource: UITableViewDataSource? {
		get {
			stubbedDataSource
		}
		set {
			stubbedDataSource = newValue
		}
	}

	override var delegate: UITableViewDelegate? {
		get {
			stubbedDelegate
		}
		set {
			stubbedDelegate = newValue
		}
	}

	override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
		stubbedDequeuedReusableCell
	}

	override func reloadData() {
		reloadDataCalled = true
	}

	override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
		stubbedCell
	}
}
