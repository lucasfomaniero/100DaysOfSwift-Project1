//
//  ViewController.swift
//  Project1
//
//  Created by Lucas Maniero on 02/12/21.
//

import UIKit

class TableViewController: UITableViewController {
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
        pictures = pictures.sorted()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageName = pictures[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.imageName = imageName
        detailViewController.navigationItem.title = "Picture \(indexPath.row + 1) of \(pictures.count) "
        
        // Presents the new viewcontroller as a dismissible Viewcontroler
//        self.present(detailViewController, animated: true, completion: nil)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

