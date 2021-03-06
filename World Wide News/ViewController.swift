//
//  ViewController.swift
//  World Wide News
//
//  Created by namit on 11/14/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    let newLabel: UILabel = {
        let newlabel = UILabel()
        newlabel.translatesAutoresizingMaskIntoConstraints = false
        newlabel.textColor = UIColor(red:0.961, green:0.275, blue:0.259, alpha: 1.000)
        newlabel.text = "Worldwide News"
        newlabel.font = UIFont.boldSystemFont(ofSize: 35)
        return newlabel
    }()
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor.lightGray
        return tableview
    }()
    let marginTop: CGFloat = 44
    let margin: CGFloat = 10
    var titleAray = [String]()
    var url = [String]()
    var urlToImage = [String]()
    var content = [String]()
    var source = [String]()
    var author = [String]()
    var publishedAt = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        setLayout()
        tableView.register(worldList.self, forCellReuseIdentifier: "worldList")
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        tableView.reloadData()
    }
    func addSub(){
        view.addSubview(newLabel)
        view.addSubview(tableView)
    }
    func setLayout(){
        newLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: marginTop).isActive = true
        newLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        newLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        newLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tableView.topAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    func getData(){
        let url = "https://newsapi.org/v2/top-headlines?sources=bbc-news,cbc-news,nbc-news,fox-news,mtv-news=&page=1&pageSize=10&apiKey="
        let apiKey = "96a1fb8d5a7648a8a5874efdbc1cb9b5"
        AF.request(url + apiKey, method: .get).responseJSON{ [weak self]response in
            guard let strongSelf = self else{return}
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                for item in json["articles"].arrayValue{
                    strongSelf.titleAray.append(item["title"].stringValue)
                    strongSelf.url.append(item["url"].stringValue)
                    strongSelf.urlToImage.append(item["urlToImage"].stringValue)
                    strongSelf.author.append(item["author"].stringValue)
                    strongSelf.publishedAt.append(item["publishedAt"].stringValue)
                    strongSelf.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleAray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldList", for: indexPath) as! worldList
        cell.contentLabel.text = titleAray[indexPath.row]
        cell.photoImageView.kf.setImage(with: URL(string: urlToImage[indexPath.row]))
        cell.photoImageView.clipsToBounds = true
        cell.titleNewLabel.text = author[indexPath.row]
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate,
                                       .withTime,
                                       .withDashSeparatorInDate,
                                       .withColonSeparatorInTime]
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        let updateAtStr = "\(publishedAt[indexPath.row])"
        let updateAt = dateFormatter.date(from: updateAtStr)
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.timeZone = TimeZone(identifier: "GMT")
        let renAt = formatter.string(from: updateAt!)
        cell.timerLabel.text = renAt
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.separatorColor = UIColor.red
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let urls = url[(indexPath?.row)!]
        if let urlLink = URL(string: urls){
            let vc = SFSafariViewController(url: urlLink,entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true) {
            }
        }
    }
}

