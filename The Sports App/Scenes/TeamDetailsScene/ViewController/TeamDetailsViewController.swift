//
//  TeamDetailsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import UIKit
class TeamDetailsViewController: UIViewController {
    var passedDataToTeamDetailsVC : Teams?
    var teams =  [Teams]()
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBAction func backToLeagueDetailsVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewConfig()
    }
    func ViewConfig(){
        teamNameLabel.text = passedDataToTeamDetailsVC?.strTeam
        stadiumLabel.text = passedDataToTeamDetailsVC?.strStadium
        teamImageView.downloaded(from: passedDataToTeamDetailsVC!.strTeamFanart1)
    }
}

