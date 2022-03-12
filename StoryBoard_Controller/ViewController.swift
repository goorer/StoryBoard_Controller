//
//  ViewController.swift
//  ControllSample
//
//  Created by Goorer on 2022/03/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello,World!"
    }


    @IBAction func button(_ sender: Any) {
        let text = textBox.text
        label.text = text
    }
    
    @IBAction func button2(_ sender: Any) {
        // navigation遷移
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "next")
        self.present(navigationController, animated: true, completion: nil)
    }
}


class ViewController2nd: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func returnButton(_ sender: Any) {
        // モーダル表示時戻る
        self.dismiss(animated: true, completion: nil)
    }
}

class ViewController3rd: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func backNavigationView(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController3rd: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TableViewCell
        cell.tableViewCellDelegate = self
        return cell
    }
    
}

extension ViewController3rd: TableViewCellDelegate{
    func backNavigation() {
        self.backNavigationView()
    }
}

protocol TableViewCellDelegate{
    func backNavigation()
}


class TableViewCell: UITableViewCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var tableViewCellDelegate : TableViewCellDelegate?
    
    @IBAction func backNavigation(_ sender: Any) {
        tableViewCellDelegate?.backNavigation()
    }
}
