//
//  ViewController.swift
//  Project1
//
//  Created by Lucas Maniero on 02/12/21.
//

import UIKit

class ViewController: UITableViewController {
    private var pictures: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        let fileManager  = FileManager.default
        let imagesPath = Bundle.main.resourcePath!
        let bundleItems = try? fileManager.contentsOfDirectory(atPath: imagesPath)
        self.navigationItem.title = "Storm Viewer"
        self.navigationItem.largeTitleDisplayMode = .never
        guard let items = bundleItems else { return }

        items.forEach { item in
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        print(indexPath.row)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }


}

