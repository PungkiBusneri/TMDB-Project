//
//  MainViewController.swift
//  TestMovie
//
//  Created by Pungki Busneri on 28/02/24.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var topActors: UICollectionView!
    @IBOutlet var onTrendingMovies: UICollectionView!
    
    private var refreshControl: UIRefreshControl!
    private var topActorAndActris = [TopActorAndActris]()
    private var trendingMovies = [OnTrendingMovies]()
    private var topActorsCellIdentifier = "TopActorAndActrisCollectionViewCell"
    private var onTrendingCellIdentifier = "OnTrendingMoviesCollectionViewCell"

    
    var timeWindow: String {
            return "week"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRefreshControl()
        fetchMoviesComponent()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
   
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        resizeRefreshControl(from: refreshControl)
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        onTrendingMovies.addSubview(refreshControl)
    }
    @objc func handleRefreshControl() {
            fetchMoviesComponent() 
           refreshControl.endRefreshing()
    }
    
    func  fetchMoviesComponent() {
        topActors.delegate = self
        topActors.dataSource = self
        topActors.register(UINib(nibName: "TopActorAndActrisCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: topActorsCellIdentifier)
        onTrendingMovies.delegate = self
        onTrendingMovies.dataSource = self
        onTrendingMovies.register(UINib(nibName: "OnTrendingMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: onTrendingCellIdentifier)
        
       
        MainManager.topActorAndActrisHandler(page: 1) { data, error, statusCode in
            if let error = error {
                
            } else {
                if let topActorsData = data {
                    self.topActorAndActris = topActorsData
                    self.topActors.reloadData()
                }
            }
        }
        
        MainManager.onTrendingMoviesHandler(timeWindow: timeWindow) { data, error, statusCode in
            if let error = error {
                
            } else {
                if let onTrendingMoviesData = data {
                    self.trendingMovies = onTrendingMoviesData
                    self.onTrendingMovies.reloadData()
                }
            }
        }
    }
}

extension MainViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topActors:
            return topActorAndActris.count
        case onTrendingMovies:
            return trendingMovies.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
            
        case topActors:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topActorsCellIdentifier, for: indexPath) as! TopActorAndActrisCollectionViewCell
            let topPerson = topActorAndActris[indexPath.item]
            cell.setupCell(topPerson: topPerson)
            
            return cell
            
        case onTrendingMovies:
            let onCell = collectionView.dequeueReusableCell(withReuseIdentifier: onTrendingCellIdentifier, for: indexPath) as! OnTrendingMoviesCollectionViewCell
            let onTrendingMovie = trendingMovies[indexPath.item]
            onCell.setupCellMovies(onMovie: onTrendingMovie)
            
            return onCell
            
        default:
            fatalError()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == onTrendingMovies {
            if indexPath.item < trendingMovies.count {
                let detailViewController = DetailMovieViewController()
                detailViewController.id = trendingMovies[indexPath.item].id
                navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topActors {
            return CGSize(width: (self.view.frame.size.width/5) - (-8), height: 124)
        } else if collectionView == onTrendingMovies {
            let collectionViewWidth = collectionView.frame.width
            let cellWidth = (collectionViewWidth - 5) / 2

            return CGSize(width: cellWidth, height: 300)
        }

        return CGSize(width: 0, height: 0)
    }
}
