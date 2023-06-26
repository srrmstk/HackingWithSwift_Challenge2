//
//  ViewController.swift
//  Challenge2
//
//  Created by srrmstk on 26.06.2023.
//

import UIKit

class ViewController: UITableViewController {

  let shoppingItems = [String]()
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingItem", for: indexPath)
    var content = cell.defaultContentConfiguration()
    content.text = shoppingItems[indexPath.row]
    cell.contentConfiguration = content
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingItems.count
  }

}

