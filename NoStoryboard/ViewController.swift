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
    let minHeaderHeight: CGFloat = 40

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
        tableView.contentInset = UIEdgeInsets(top: maxHeaderHeight, left: 0, bottom: 0, right: 0)
        //tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let y = -scrollView.contentOffset.y
        let headerHeight = max(y, minHeaderHeight)
        headerViewHeight.constant = headerHeight
        //tableView.scrollIndicatorInsets.top = headerHeight
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
