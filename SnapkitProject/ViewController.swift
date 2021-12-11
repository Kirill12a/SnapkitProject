//
//  ViewController.swift
//  SnapkitProject
//
//  Created by Kirill Drozdov on 11.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController{
   
    
  
    let cellWithToLabels = "cellWithToLabels"
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
      
//        tableView.separatorStyle = .none
        
        
//        tableView.style = .grouped
       
       
        return tableView
    }()
    
  
    private lazy var cell1: UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell 0"
        return cell
    }()
    

    let animals: [CellWithTwoLabelsViewModel] =
    [
            CellWithTwoLabelsViewModel(labelOneText: "Horse", labelTwoText: "Black"),
            CellWithTwoLabelsViewModel(labelOneText: "Cow",   labelTwoText: "Blue"),
            CellWithTwoLabelsViewModel(labelOneText: "Camel", labelTwoText: "Green"),
            CellWithTwoLabelsViewModel(labelOneText: "Sheep", labelTwoText: "Red"),
            CellWithTwoLabelsViewModel(labelOneText: "Goat",  labelTwoText: "White")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CellWidthToLabels", bundle: nil), forCellReuseIdentifier: cellWithToLabels)
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(0)
        }
    }

    
    
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithToLabels) as? CellWidthToLabels
        let viewModel = animals[indexPath.row]
        cell?.selectionStyle = .none
        cell?.labelOne.text = viewModel.labelOneText
        cell?.labelTwo.text = viewModel.labelTwoText
        return cell ?? UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}
