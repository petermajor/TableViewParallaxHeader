//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Peter Major on 30/12/2019.
//  Copyright © 2019 majormojo.co.uk Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let maxHeaderHeight: CGFloat = 300
    let minHeaderHeight: CGFloat = 44

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "banner")
        imageView.contentMode = .scaleAspectFill
        
        headerViewHeight.constant = maxHeaderHeight
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.insetsLayoutMarginsFromSafeArea = false
        tableView.contentInsetAdjustmentBehavior = .never;
        tableView.insetsContentViewsToSafeArea = false

        tableView.contentInset = UIEdgeInsets(top: maxHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset.y = -maxHeaderHeight
        
        updateHeaderHeight()
    }
    
    func updateHeaderHeight() {
        let headerHeight = max(-tableView.contentOffset.y, minHeaderHeight)
        headerViewHeight.constant = headerHeight
        
        imageView.alpha = (headerHeight - minHeaderHeight) / (maxHeaderHeight - minHeaderHeight)
        print("contentOffset.y: \(tableView.contentOffset.y), headerViewHeight.constant: \(headerViewHeight.constant)")
    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderHeight()
    }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
}
