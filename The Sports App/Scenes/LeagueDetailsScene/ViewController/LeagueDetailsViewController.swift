//
//  LeagueDetailsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    // MARK: - Propreties
    var passedDataToLeagueDetailsVCfromDB : Bookmarks?
    var idLeague: String?
    var passedDataToLeagueDetailsVC : League?
    var passedDatavc : Teams?
    var teams =  [Teams]()
    var leagueDetailsViewModel = LeagueDetailsViewModel()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // MARK: - @IBOutlets
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    // MARK: - @IBAction
    @IBAction func backToLeaguesVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func favoriteButton(_ sender: UIButton) {
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
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailsTableView.delegate = self
        leagueDetailsTableView.dataSource = self
        leagueDetailsTableView.register(UINib(nibName: "UpcomingEventsTableViewCell", bundle: .main), forCellReuseIdentifier: "UpcomingEventsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "LatestResultsTableViewCell", bundle: .main), forCellReuseIdentifier: "LatestResultsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "TeamsTableViewCell", bundle: .main), forCellReuseIdentifier: "TeamsTableViewCell")
        leagueName.text = passedDataToLeagueDetailsVC?.strLeague
        leagueName.text = passedDataToLeagueDetailsVCfromDB?.strLeague
        GlobalNotificationCenter().nc.addObserver(self, selector: #selector(presentVC), name: Notification.Name("present"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        leagueName.text = passedDataToLeagueDetailsVC?.strLeague
    }
    @objc func presentVC(_ sender: UITapGestureRecognizer? = nil) {
        let vc = UIStoryboard(name: "TeamDetails", bundle: .main).instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
// MARK: - TableView
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
    }
}
