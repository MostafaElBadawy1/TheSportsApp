//
//  LeaguesViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
    // MARK: - Props
    var passedData : Sport?
    var leagueName: String?
    var leagues = [League]()
    var leaguesArray = [League]()
    var leaguesViewModel = LeaguesViewModel()
    // MARK: - IBOutlets
    @IBOutlet weak var leaguesTableView: UITableView!
    // MARK: - LifeCycle
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
                //print(league)
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
        return leaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.strSport.text = leaguesArray[indexPath.row].strSport
        cell.strLeague.text = leaguesArray[indexPath.row].strLeague
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leaguesTableView.deselectRow(at: indexPath, animated: true)
        let passedDatavc = leaguesArray[indexPath.row]
        
        let vc = UIStoryboard(name: "LeagueDetails", bundle: nil).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.passedDataz = passedDatavc
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func viewDidAppear(_ animated: Bool) {
        for x in leagues {
            if x.strSport == leagueName {
                leaguesArray.append(x)
                leaguesTableView.reloadData()
            }
        }
    }
}
