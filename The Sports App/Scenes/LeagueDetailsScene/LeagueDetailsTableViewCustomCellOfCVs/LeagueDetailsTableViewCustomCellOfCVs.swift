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
        return 1
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
        cell.strEvent.text = "aaa"
        cell.dateLabel.text = "bbb"
        cell.timeLabel.text = "ccc"
        return cell
    }
}
