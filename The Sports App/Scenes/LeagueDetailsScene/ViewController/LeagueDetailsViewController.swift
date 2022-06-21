//
//  LeagueDetailsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    var passedDataz : League?

    @IBOutlet weak var leagueDetailsTableView: UITableView!
    
    @IBAction func backToLeaguesVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailsTableView.delegate = self
        leagueDetailsTableView.dataSource = self
        leagueDetailsTableView.register(UINib(nibName: "UpcomingEventsTableViewCell", bundle: .main), forCellReuseIdentifier: "UpcomingEventsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "LatestResultsTableViewCell", bundle: .main), forCellReuseIdentifier: "LatestResultsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "TeamsTableViewCell", bundle: .main), forCellReuseIdentifier: "TeamsTableViewCell")

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
    }
}
