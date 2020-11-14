//
//  worldList.swift
//  World Wide News
//
//  Created by namit on 11/14/20.
//

import UIKit

class worldList: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
//        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    let photoImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.italicSystemFont(ofSize: 17)
        contentLabel.textColor = UIColor.black
        return contentLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()

    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(contentLabel)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        contentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -50).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        
        photoImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: 0).isActive = true
        photoImageView.widthAnchor.constraint(equalTo:containerView.widthAnchor, multiplier: 1/2, constant: -10).isActive = true
        

    }

}
