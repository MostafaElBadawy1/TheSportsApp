//
//  SportsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    // MARK: - Props
    let sportsViewModel = SportsViewModel()
    var sports = [Sport]()
    // MARK: - IBOutlets
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initView()
    }
    // MARK: - Main Functions
    func initView() {
        tableViewConfig()
        //handleEmpty()
    }
    func initViewModel() {
        //appendNew()
        fetchData()
    }
    // MARK: - Data Functions
    func fetchData() {
        Task.init {
            if let sports = await sportsViewModel.fetch() {
                print(sports)
                self.sports = sports
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
    // MARK: - View Functions
    func tableViewConfig() {
        sportsCollectionView.dataSource = self
        sportsCollectionView.delegate = self
        sportsCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        //        tableView.rowHeight = 60
        //        tableView.tableFooterView = nil
        //        tableView.tableHeaderView = nil
    }
}
// MARK: - CollectionViewDataSource
extension SportsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.strsport.text = sports[indexPath.row].strSport
        cell.strsportThumb.downloaded(from: sports[indexPath.row].strSportThumb)
        cell.backgroundColor = .systemMint
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
// MARK: - CollectionViewDelegate
extension SportsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sportsCollectionView.deselectItem(at: indexPath, animated: true)
        let passedData = sports[indexPath.row]
        // let storyboard = UIStoryboard(name: "Leagues", bundle: nil)
        let vc = UIStoryboard(name: "Leagues", bundle: nil).instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        vc.passedData = passedData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - CollectionViewDelegateFlowLayout
extension SportsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
