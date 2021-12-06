//
//  DetailViewController.swift
//  Project1
//
//  Created by Lucas Maniero on 06/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName: String? {
        didSet {
            imageTextLabel.text = imageName
        }
    }
    
    var imageTextLabel: UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.font = .systemFont(ofSize: 16, weight: .semibold)
        il.contentMode = .center
        return il
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemBackground
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(imageTextLabel)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            imageTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            imageTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
