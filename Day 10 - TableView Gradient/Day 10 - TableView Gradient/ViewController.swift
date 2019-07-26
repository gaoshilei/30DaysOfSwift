//
//  ViewController.swift
//  Day 10 - TableView Gradient
//
//  Created by gaoshilei on 2019/7/25.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let dataList = ["Swift is a powerful and", "intuitive programming", "language for macOS, iOS, watchOS, tvOS", "and beyond. Writing Swift code", "is interactive and fun,", "the syntax is concise yet expressive,", "and Swift includes modern features", "developers love. Swift code is safe by", "design, yet also produces software", "that runs lightning-fast.","String reimplemented with UTF-8 encoding, which often results in faster code","Exclusive access to memory enforced by default on debug and releas", "e builds SIMD Vector and Result types in Standard Library","Performance improvements to Dictionary and Set","Support for dynamically callable types to improve ", "interoperability with dynamic languages such as Python, JavaScript, and Ruby"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "gradientCell", bundle: .main), forCellReuseIdentifier: "gradientCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gradientCell", for: indexPath) as! gradientCell
        let totalCount = dataList.count + 1
        let topIndex = CGFloat(1.0) / CGFloat(totalCount) * CGFloat(dataList.count-indexPath.row)
        let bottomIndex = CGFloat(1.0) / CGFloat(totalCount) * CGFloat(dataList.count-indexPath.row-1)
        let topColor = UIColor(red: 1.0, green: CGFloat(topIndex), blue: 0, alpha: 1)
        let bottomColor = UIColor(red: 1.0, green: CGFloat(bottomIndex), blue: 0, alpha: 1)
        cell.setTitle(title: dataList[indexPath.row])
        cell.setGradientColor(topColor: topColor, bottomColor: bottomColor)
        return cell
    }
}

