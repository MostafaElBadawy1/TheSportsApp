//
//  SportsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    let arr = ["Mostafa","ygfjfdy","aaaaaa","ppppp","qsdqdqd","qwqwqdv" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()

        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self

        sportsCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    func fetch() {
        Task.init {
            if let sports = try? await NetworkManager.shared.fetchSports(endPoint: "api/v1/json/2/all_sports.php", model: SportsModel.self) {
                print(sports)
            } else {
                print("error")
            }
        }
    }

}




extension SportsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(arr.count)
        return arr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.strsport.text = arr[indexPath.row]
        //cell.backgroundColor = .
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
extension SportsViewController: UICollectionViewDelegateFlowLayout{
    
 

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
    
    }
}
