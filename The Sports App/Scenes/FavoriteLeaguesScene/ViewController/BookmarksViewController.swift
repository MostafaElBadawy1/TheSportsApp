//
//  BookmarksViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    // MARK: - Propreties
    var leagues = [League]()
    let alert : UIAlertController = UIAlertController(title:"You Are Disconnected!" , message: "Please Connect to Network", preferredStyle: .alert)
    var bookmarksModel = [Bookmarks]()
    // MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        fetchBookmarks()
        netMonitorAlert()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBookmarks()
    }
    // MARK: - NetworkAlertandCoreDataFetching
    func netMonitorAlert() {
        if NetworkMonitor.shared.isConnected  {
            print("you are connected")
        } else {
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func fetchBookmarks() {
        CoreDataManger.shared.fetch(entityName: Bookmarks.self) { (bookmarks) in
            self.bookmarksModel = bookmarks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
// MARK: - TableView
extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookmarksModel.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dataFromDB = bookmarksModel[indexPath.row]
        let vc = UIStoryboard(name: "LeagueDetails", bundle: nil).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.passedDataToLeagueDetailsVCfromDB = dataFromDB
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.strLeague.text = bookmarksModel[indexPath.row].leagureTitle
        cell.strBadge.downloaded(from: bookmarksModel[indexPath.row].strBadge ?? "https://www.thesportsdb.com/images/media/league/fanart/xutrys1422400857.jpg")
        cell.strBadge.layer.masksToBounds = true
        cell.strBadge.layer.cornerRadius =  cell.strBadge.frame.height/2
        cell.strBadge.layer.borderWidth = 0.5
        cell.strBadge.layer.borderColor = UIColor.black.cgColor
        cell.strBadge.clipsToBounds = true
        cell.cellDelegate = self
        cell.index = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let item = bookmarksModel[indexPath.row]
            CoreDataManger.shared.delete(entityName: Bookmarks.self, delete: item)
            CoreDataManger.shared.fetch(entityName: Bookmarks.self) { (item) in
                self.bookmarksModel = item
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
// MARK: - TableViewCell button Delegate
extension BookmarksViewController: TableViewYT {
    func pressCell(index: Int) {
        print("the index is:\(index) ")
        if let youTubeURL = URL(string:"https://\(String(describing: bookmarksModel[index].strLeague))" ){
            UIApplication.shared.open(youTubeURL)
        }
    }
}
