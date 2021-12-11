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
    

//    let animals: [CellWithTwoLabelsViewModel] =
//    [
//            CellWithTwoLabelsViewModel(labelOneText: "Horse", labelTwoText: "Black"),
//            CellWithTwoLabelsViewModel(labelOneText: "Cow",   labelTwoText: "Blue"),
//            CellWithTwoLabelsViewModel(labelOneText: "Camel", labelTwoText: "Green"),
//            CellWithTwoLabelsViewModel(labelOneText: "Sheep", labelTwoText: "Red"),
//            CellWithTwoLabelsViewModel(labelOneText: "Goat",  labelTwoText: "White")
//    ]
    
    let dataWithImages: [CellWithTwoLabelsAndImageViewModel] =
    [
        CellWithTwoLabelsAndImageViewModel(
            title: "titile 1",
            text: "text 1",
            image: Constants.Image.house ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
            title: "titile 2",
            text: "text 2",
            image: Constants.Image.pencil ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
            title: "titile 3",
            text: "text 3",
            image: Constants.Image.lasso ?? UIImage()
        ),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "CellWidthToLabels", bundle: nil), forCellReuseIdentifier: cellWithToLabels) // первый метод
        tableView.register(CellWithTwoLabelsAndImage.self, forCellReuseIdentifier: cellWithToLabels)
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
//        return animals.count
        return dataWithImages.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithToLabels) as? CellWithTwoLabelsAndImage
//        let viewModel = animals[indexPath.row]
        let viewModel = dataWithImages[indexPath.row]
        cell?.selectionStyle = .none
        cell?.configure(viewModel)
//        cell?.labelOne.text = viewModel.labelOneText
//        cell?.labelTwo.text = viewModel.labelTwoText
        return cell ?? UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}
