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
        leagueDetailsTableView.register(UINib(nibName: "LeagueDetailsTableViewCustomCellOfCVs", bundle: .main), forCellReuseIdentifier: "LeagueDetailsTableViewCustomCellOfCVs")
//        leagueDetailsTableView.register(UINib(nibName: "CVsTableViewCustomCell", bundle: .main), forCellReuseIdentifier: "CVsTableViewCustomCell")
    }
  
}
extension LeagueDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "LeagueDetailsTableViewCustomCellOfCVs", for: indexPath) as! LeagueDetailsTableViewCustomCellOfCVs
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
