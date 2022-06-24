//
//  LeagueDetailsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    var passedDataToLeagueDetailsVCfromDB : Bookmarks?
    var bookmarksModel = [Bookmarks]()
    var idLeague: String?
    var passedDataToLeagueDetailsVC : League?
    var passedDatavc : Teams?
    var teams =  [Teams]()
    var leagueDetailsViewModel = LeagueDetailsViewModel()
    var upcomtingEvents = [Bookmarks]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBAction func favoriteButton(_ sender: UIButton) {
//        if leagueName.text == Bookmarks(context: self.context).leagureTitle{
            Bookmarks(context: self.context).leagureTitle = passedDataToLeagueDetailsVC?.strLeague ?? ""
            Bookmarks(context: self.context).strBadge = passedDataToLeagueDetailsVC?.strBadge ?? ""
            Bookmarks(context: self.context).strLeague = passedDataToLeagueDetailsVC?.strYoutube ?? ""
            do {
                try self.context.save()
                bookmarkBtn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } catch {
                print("Error")
            }

    }
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    
    @IBAction func backToLeaguesVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(passedDataToLeagueDetailsVC?.idLeague)
       print("zazazazazazazazazazazazazaza")
        leagueDetailsTableView.delegate = self
        leagueDetailsTableView.dataSource = self
        leagueDetailsTableView.register(UINib(nibName: "UpcomingEventsTableViewCell", bundle: .main), forCellReuseIdentifier: "UpcomingEventsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "LatestResultsTableViewCell", bundle: .main), forCellReuseIdentifier: "LatestResultsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "TeamsTableViewCell", bundle: .main), forCellReuseIdentifier: "TeamsTableViewCell")
        leagueName.text = passedDataToLeagueDetailsVC?.strLeague
        leagueName.text = passedDataToLeagueDetailsVCfromDB?.strLeague
        GlobalNotificationCenter().nc.addObserver(self, selector: #selector(presentVC), name: Notification.Name("present"), object: nil)
        //leagueName.layer.cornerCurve = .circular
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        leagueName.text = passedDataToLeagueDetailsVC?.strLeague
//        if Bookmarks(context: context).leagureTitle == passedDataToLeagueDetailsVC?.strLeague  {
//            bookmarkBtn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
//                } else if Bookmarks(context: context).leagureTitle != leagueName.text {
//                    bookmarkBtn.setImage(UIImage(systemName: "bookmarkr"), for: .normal)
//                }
        // check if item is availabe or not
        // if aviable bookmarks.fill image
        // else bookmarks
    }
    @objc func presentVC(_ sender: UITapGestureRecognizer? = nil) {
            
            let vc = UIStoryboard(name: "TeamDetails", bundle: .main).instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    
   }
extension LeagueDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "UpcomingEventsTableViewCell", for: indexPath) as! UpcomingEventsTableViewCell
        return cell
    }
        if indexPath.row == 1 {
            let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "LatestResultsTableViewCell", for: indexPath) as! LatestResultsTableViewCell
            return cell
        }
        let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as! TeamsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
extension LeagueDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueDetailsTableView.deselectRow(at: indexPath, animated: true)
//        let vc = UIStoryboard(name: "TeamDetails", bundle: .main).instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
//        vc.passedDataz = passedDatavc
//        //vc.modalPresentationStyle = .fullScreen
//        //self.present(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)

    }
}
