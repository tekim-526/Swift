//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by Kim TaeSoo on 2021/08/08.
//

import UIKit
// table view 리스트의 경우 하나의 모양(셀)을 만들고 그 모양을 쓰는 방식임
class ViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        // cell 을 등록함
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }

    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            return (cell)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        return (cell)
        
    }
    // 모든 cell높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return (UITableView.automaticDimension)
        }
        return (60)
    }
}
