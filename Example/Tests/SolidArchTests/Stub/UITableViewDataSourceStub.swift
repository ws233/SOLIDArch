//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import UIKit

class UITableViewDataSourceStub: NSObject, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		UITableViewCell()
	}
}
