//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import UIKit
import SOLIDArch

class UITableViewCellStub: UITableViewCell & Configurable {

	var stubbedItemViewModel: ItemViewModelStub!

	var viewModel: ItemViewModelStub? {
		get {
			stubbedItemViewModel
		}
		set {}
	}
}
