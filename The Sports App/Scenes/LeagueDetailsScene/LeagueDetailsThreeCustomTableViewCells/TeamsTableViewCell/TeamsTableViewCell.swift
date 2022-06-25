//
//  TeamsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    // MARK: - Propreties
    var teams =  [Teams]()
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    // MARK: - @IBOutlets
    @IBOutlet weak var teamsCollectionViewInTableViewCell: UICollectionView!
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionViewInTableViewCell.delegate = self
        teamsCollectionViewInTableViewCell.dataSource = self
        teamsCollectionViewInTableViewCell.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        fetchTeamsData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func fetchTeamsData() {
        Task.init {
            if let teams = await leagueDetailsViewModel.fetchTeams() {
                self.teams = teams
                DispatchQueue.main.async {
                    self.teamsCollectionViewInTableViewCell.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
// MARK: - CollectionView
extension TeamsTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        cell.teamImage.downloaded(from: teams[indexPath.row].strTeamFanart1)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius =  cell.frame.height/2
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        return cell
    }
}
extension TeamsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 150)
    }
}

