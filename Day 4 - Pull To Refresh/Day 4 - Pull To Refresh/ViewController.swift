//
//  ViewController.swift
//  Day 4 - Pull To Refresh
//
//  Created by gaoshilei on 2019/7/20.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataList = Array<Date>()
    var refresher = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dataList.insert(Date(), at: 0)
        refresher.attributedTitle = NSMutableAttributedString(string: "释放即可刷新")
        refresher.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        tableView.addSubview(refresher)
        tableView.backgroundColor = .white
    }
    
    @objc func pullRefresh() {
        dataList.insert(Date(), at: 0)
        refresher.endRefreshing()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "PullToRefreshCell")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataList[indexPath.row])
        cell.textLabel?.text = "cell-\(indexPath.row)==\(dateStr)"
        return cell
    }
    
}

