//
//  ViewController.swift
//  Challenge2
//
//  Created by srrmstk on 26.06.2023.
//

import UIKit

class ViewController: UITableViewController {

  var shoppingItems = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
    let shareButton = UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(shareItems))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearList))
    navigationItem.rightBarButtonItems = [shareButton, addButton]
  }

  @objc
  func shareItems() {
    let ac = UIActivityViewController(activityItems: [shoppingItems.joined(separator: "\n")], applicationActivities: nil)
    present(ac, animated: true)
  }

  @objc
  func addItem() {
    let ac = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
    ac.addTextField()

    let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
      guard let item = ac?.textFields?[0].text else { return }
      if (item.isEmpty) { return }
      self?.shoppingItems.insert(item, at: 0)

      let indexPath = IndexPath(row: 0, section: 0)
      self?.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    ac.addAction(submitAction)
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(ac, animated: true)
  }

  @objc
  func clearList() {
    shoppingItems = []
    tableView.reloadData()
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

