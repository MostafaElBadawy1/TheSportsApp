//
//  LeagueDetailsTableViewCustomCellOfCVs.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LeagueDetailsTableViewCustomCellOfCVs: UITableViewCell {
    @IBOutlet weak var collectionViewInTableViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewInTableViewCell.dataSource = self
        collectionViewInTableViewCell.delegate = self
        collectionViewInTableViewCell.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")
        collectionViewInTableViewCell.register(UINib(nibName: "LatestResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LatestResultsCollectionViewCell")
        collectionViewInTableViewCell.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension LeagueDetailsTableViewCustomCellOfCVs: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    }
extension LeagueDetailsTableViewCustomCellOfCVs: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            if indexPath.row == 0 {
//           
//                let cell = collectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
//                cell.strEvent.text = "aaa"
//                cell.dateLabel.text = "bbb"
//                cell.timeLabel.text = "ccc"
//                return cell
//            }
            if indexPath.row == 1 {
                let cell = collectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "LatestResultsCollectionViewCell", for: indexPath) as! LatestResultsCollectionViewCell
                cell.teamVsTeamLabel.text = "real x barca"
                cell.scoreVsScoreLabel.text = "2 x 2"
                cell.dateLabel.text = "12/5"
                cell.timeLabel.text = "2:30"
                collectionViewInTableViewCell.s
                return cell
            }
            if indexPath.row == 2 {
                let cell = collectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
                cell.teamName.text = "Ahly"
                return cell
                        }
        let cell = collectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
        cell.strEvent.text = "aaa"
        cell.dateLabel.text = "bbb"
        cell.timeLabel.text = "ccc"
        return cell
    }
}
// MARK: - CollectionViewDelegateFlowLayout
extension LeagueDetailsTableViewCustomCellOfCVs: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
