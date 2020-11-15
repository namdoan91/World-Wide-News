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
        view.layer.cornerRadius = 30
        return view
    }()
    let photoImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 20
        return imageview
    }()
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.italicSystemFont(ofSize: 15)
        contentLabel.textColor = UIColor.black
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return titleNewLabel
    }()
    let timerLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleNewLabel.textColor = UIColor(red:0.275, green:0.282, blue:0.298, alpha: 1.000)
        return titleNewLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
        containerView.backgroundColor = UIColor(red:0.906, green:0.910, blue:0.918, alpha: 1.000)
//        let currentDateTime = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .long
//        timerLabel.text = "\(dateFormatter.string(from: currentDateTime))"
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(timerLabel)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        
        titleNewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        titleNewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        titleNewLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45, constant: 0).isActive = true
        titleNewLabel.heightAnchor.constraint(equalTo:self.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -35).isActive  = true
        contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45, constant: 0).isActive = true
        contentLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.4, constant: 0).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        photoImageView.widthAnchor.constraint(equalTo:self.widthAnchor,multiplier: 0.45,constant: 0).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        timerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5).isActive  = true
        timerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45, constant: 0).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.2, constant: 0).isActive = true
        
    }
}
