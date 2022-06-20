//
//  LeaguesViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
    var passedData : Sport?
    let leaguesViewModel = LeaguesViewModel()
    var leagues = [League]()
    
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        fetchData()
    }
    func fetchData() {
        Task.init {
            if let league = await leaguesViewModel.fetch() {
                print(league)
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
extension LeaguesViewController: UITableViewDelegate {
    
    }
extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.strSport.text = leagues[indexPath.row].strSport
        cell.strLeague.text = leagues[indexPath.row].strLeague
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leaguesTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
