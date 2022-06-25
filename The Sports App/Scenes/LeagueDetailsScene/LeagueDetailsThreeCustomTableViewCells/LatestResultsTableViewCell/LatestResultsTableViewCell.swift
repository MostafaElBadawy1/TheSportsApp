//
//  LatestResultsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LatestResultsTableViewCell: UITableViewCell {
    // MARK: - Propreties
    var latestResults =  [LatestResults]()
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    // MARK: - @IBOutlets
    @IBOutlet weak var latestResultsCollectionViewInTableViewCell: UICollectionView!
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        latestResultsCollectionViewInTableViewCell.delegate = self
        latestResultsCollectionViewInTableViewCell.dataSource = self
        latestResultsCollectionViewInTableViewCell.register(UINib(nibName: "LatestResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LatestResultsCollectionViewCell")
        fetchLatestResultsData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func fetchLatestResultsData() {
        Task.init {
            if let latestResults = await leagueDetailsViewModel.fetchLatestResults(id: passedID!) {
                self.latestResults = latestResults
                DispatchQueue.main.async {
                    self.latestResultsCollectionViewInTableViewCell.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
// MARK: - CollectionView
extension LatestResultsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        latestResultsCollectionViewInTableViewCell.deselectItem(at: indexPath, animated: false)
    }
}
extension LatestResultsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestResults.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = latestResultsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "LatestResultsCollectionViewCell", for: indexPath) as! LatestResultsCollectionViewCell
        cell.homeTeamLabel.text = latestResults[indexPath.row].strHomeTeam
        cell.awayTeamLabel.text = latestResults[indexPath.row].strAwayTeam
        cell.homeScoreLabel.text = latestResults[indexPath.row].intHomeScore
        cell.awayScoreLabel.text = latestResults[indexPath.row].intAwayScore
        cell.dateLabel.text = latestResults[indexPath.row].dateEvent
        cell.timeLabel.text = latestResults[indexPath.row].strTime
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius =  cell.frame.height/4
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        return cell
    }
}
extension LatestResultsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 130)
    }
}
