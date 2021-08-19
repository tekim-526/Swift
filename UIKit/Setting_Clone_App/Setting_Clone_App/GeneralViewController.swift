//
//  GeneralViewController.swift
//  Setting_Clone_App
//
//  Created by Kim TaeSoo on 2021/08/12.
//

import UIKit

class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView! {
        didSet { // rightimage가 메모리에 올라갈 때 실행 된다
            rightImage.image = UIImage.init(systemName: "chevron.right")
            rightImage.backgroundColor = .clear
            rightImage.tintColor = .orange
        }
    }
}

struct GeneralModel {
    var leftTitle: String = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    // label에 밑에서 model에 append 한 글자를 넣어주는 과정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "general"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        model.append(
        [GeneralModel(leftTitle: "About")]
        )
        
        model.append(
        [GeneralModel(leftTitle: "Keyboard"),
        GeneralModel(leftTitle: "Game Controller"),
        GeneralModel(leftTitle: "Fonts"),
        GeneralModel(leftTitle: "Language & Region"),
        GeneralModel(leftTitle: "Dictionary")]
        )
        model.append(
        [GeneralModel(leftTitle: "Reset")]
        )
    }
    


}
