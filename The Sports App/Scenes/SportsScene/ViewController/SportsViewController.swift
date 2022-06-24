//
//  SportsViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    // MARK: - Props
    var loadingIndicator = UIActivityIndicatorView()
    let sportsViewModel = SportsViewModel()
    var sports = [Sport]()
    let alert : UIAlertController = UIAlertController(title:"You Are Disconnected!" , message: "Please Connect to Network", preferredStyle: .alert)
    
    // MARK: - IBOutlets
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        netMonitorAlert()
    }
    // MARK: - Main Functions
    func initView() {
        tableViewConfig()
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
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
       
    }
    func netMonitorAlert() {
        loadingIndicator.style = .medium
        loadingIndicator.center = view.center
       
        view.addSubview(loadingIndicator)
        if NetworkMonitor.shared.isConnected  {
            print("you are connected")
            loadingIndicator.isHidden = true
        } else {
            loadingIndicator.startAnimating()
         
            self.present(alert, animated: true, completion: nil)
        }
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
        cell.strsportThumb.layer.masksToBounds = true
        cell.strsportThumb.layer.cornerRadius =  cell.strsportThumb.frame.height/2
        cell.strsportThumb.layer.borderWidth = 0.5
        cell.strsportThumb.layer.borderColor = UIColor.black.cgColor
        cell.strsportThumb.clipsToBounds = true
        //        cell.backgroundColor = .systemGray
        // cell.strsportThumb.backgroundColor = .black
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
        let passedDatavc = sports[indexPath.row]
        
        let vc = UIStoryboard(name: "Leagues", bundle: nil).instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        vc.passedDataToLeaguesVC = passedDatavc
        vc.leagueName = sports[indexPath.row].strSport
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
