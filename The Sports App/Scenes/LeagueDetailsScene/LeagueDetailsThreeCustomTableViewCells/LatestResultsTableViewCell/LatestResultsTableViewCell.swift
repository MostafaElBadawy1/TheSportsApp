//
//  LatestResultsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class LatestResultsTableViewCell: UITableViewCell {
    @IBOutlet weak var latestResultsCollectionViewInTableViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        latestResultsCollectionViewInTableViewCell.delegate = self
        latestResultsCollectionViewInTableViewCell.dataSource = self
        latestResultsCollectionViewInTableViewCell.register(UINib(nibName: "LatestResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LatestResultsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension LatestResultsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        latestResultsCollectionViewInTableViewCell.deselectItem(at: indexPath, animated: false)
    }
    
}
extension LatestResultsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = latestResultsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "LatestResultsCollectionViewCell", for: indexPath) as! LatestResultsCollectionViewCell

        cell.homeTeamLabel.text = "real"
        cell.awayTeamLabel.text = "man city"
        cell.homeScoreLabel.text = "3"
        cell.awayScoreLabel.text = "2"

        cell.dateLabel.text = "12/5"
        cell.timeLabel.text = "2:30"
        return cell

    }
    
    
}
// MARK: - CollectionViewDelegateFlowLayout
extension LatestResultsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
