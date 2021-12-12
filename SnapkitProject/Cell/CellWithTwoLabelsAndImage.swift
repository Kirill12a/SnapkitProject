//
//  CellWithTwoLabelsAndImage.swift
//  SnapkitProject
//
//  Created by Kirill Drozdov on 11.12.2021.
//

import Foundation
import UIKit
import SnapKit

class CellWithTwoLabelsAndImage: UITableViewCell{
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenPrimary
        label.font = Constants.Fonts.systemHeading
        return label
    }()
    
    private lazy var labelText: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
       return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(labelText)
        stackView.addArrangedSubview(labelTitle)
        return stackView
    }()
    
    func configure(_ viewModel: CellWithTwoLabelsAndImageViewModel){
        labelTitle.text = viewModel.title
        labelText.text = viewModel.text
        image.image = viewModel.image
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false //
        contentView.addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        image.image = nil
    }
    private func setupConstraints(){
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
