//
//  LeaguesViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
    // MARK: - Propreties
    var passedDataToLeaguesVC : Sport?
    var leagueName: String?
    var leagues = [League]()
    var leaguesViewModel = LeaguesViewModel()
    // MARK: - IBOutlets
    @IBOutlet weak var leaguesTableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        fetchData()
    }
    // MARK: - View Function
    func tableViewConfig() {
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
    }
    // MARK: - Fetching Function
    func fetchData() {
        Task.init {
            if let league = await leaguesViewModel.fetch(sportName: leagueName ?? "") {
                self.leagues = league
                DispatchQueue.main.async {
                    self.leaguesTableView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
// MARK: - TableViewDelegate
extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leaguesTableView.deselectRow(at: indexPath, animated: true)
        let passedDatavc = leagues[indexPath.row]
        let vc = UIStoryboard(name: "LeagueDetails", bundle: nil).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.passedDataToLeagueDetailsVC = passedDatavc
        vc.idLeague = leagues[indexPath.row].idLeague
        passedID = leagues[indexPath.row].idLeague
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.strLeague.text = leagues[indexPath.row].strLeague
        cell.strBadge.downloaded(from: leagues[indexPath.row].strBadge)
        cell.strBadge.layer.masksToBounds = true
        cell.strBadge.layer.cornerRadius =  cell.strBadge.frame.height/2
        cell.strBadge.layer.borderWidth = 0.5
        cell.strBadge.layer.borderColor = UIColor.black.cgColor
        cell.strBadge.clipsToBounds = true
        cell.cellDelegate = self
        cell.index = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension LeaguesViewController: TableViewYT {
    func pressCell(index: Int) {
        if let youTubeURL = URL(string:"https://\(leagues[index].strYoutube)" ){
            UIApplication.shared.open(youTubeURL)
        }
    }
}
