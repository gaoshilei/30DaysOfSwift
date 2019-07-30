//
//  ViewController.swift
//  Day 11 - Animate TableViewCell
//
//  Created by gaoshilei on 2019/7/30.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others", "Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others","AppKitchen Studio", "Project Read", "Others"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(animateCell.self, forCellReuseIdentifier: "animateCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        performAnimate()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func performAnimate(){
        tableView.reloadData()
        let cells = tableView.visibleCells
        let height = tableView.bounds.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: CGFloat(height))
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: 1.5, delay: 0.05*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animateCell", for: indexPath)
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let itemCount = tableData.count - 1
        let color = (CGFloat(indexPath.row) / CGFloat(itemCount)) * 0.6
        cell.backgroundColor = UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    
}

