//
//  TeamsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    var teams =  [Teams]()
    //var passedData : Sport?
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    @IBOutlet weak var teamsCollectionViewInTableViewCell: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionViewInTableViewCell.delegate = self
        teamsCollectionViewInTableViewCell.dataSource = self
        teamsCollectionViewInTableViewCell.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        fetchTeamsData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
extension TeamsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passedDatavc = teams[indexPath.row]
        
        let vc = UIStoryboard(name: "TeamsDetails", bundle: nil).instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
        vc.passedDataz = passedDatavc
        //vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
extension TeamsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        cell.teamName.text = teams[indexPath.row].strTeam
        cell.teamImage.downloaded(from: teams[indexPath.row].strTeamFanart1)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius =  cell.frame.height/4
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        return cell
    }

    
    
}
// MARK: - CollectionViewDelegateFlowLayout
extension TeamsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 190)
    }
}
