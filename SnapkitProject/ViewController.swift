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
    
    
    
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        
//        button.snp.makeConstraints { make in
//            make.width.height.equalTo(50)
////            make.centerX.equalToSuperview()
//        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.setTitle("Editint", for: .normal)
        button.tintColor = .red
        view.addSubview(button)
        return button
    }()
    @objc private func buttonTapped(){
        self.tableView.isEditing = !tableView.isEditing
    }
    
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
    
    var dataWithImages: [CellWithTwoLabelsAndImageViewModel] =
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
        view.addSubview(button)
    }
    
    private func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(70)
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("deleted")
            
            self.dataWithImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.dataWithImages[sourceIndexPath.row]
        dataWithImages.remove(at: sourceIndexPath.row)
        dataWithImages.insert(movedObject, at: destinationIndexPath.row)
    }
    
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = dataWithImages[indexPath.row]
        let alertController = UIAlertController(title: "\(viewModel.title)",
                                                message: "\(viewModel.text)",
                                                preferredStyle: .alert)
        let dismisAction = UIAlertAction(title: "Ok",
                                         style: .default) { action in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        alertController.addAction(dismisAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
    
}
