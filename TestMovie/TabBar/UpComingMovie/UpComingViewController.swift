//
//  UpComingViewController.swift
//  TestMovie
//
//  Created by Pungki Busneri on 29/01/24.
//

import UIKit

class UpComingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var upComingTableView: UITableView!
    
    private var upComingMovies = [UpComingModel]()
    private var cellIdentifier = "UpComingTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingTableView.dataSource = self
        upComingTableView.delegate = self
        upComingTableView.register(UINib(nibName: "UpComingTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        fetchUpcomingMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upComingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UpComingTableViewCell
        let movie = upComingMovies[indexPath.row]
        cell.setupCell(movie: movie)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.item < upComingMovies.count {
            let detailViewController = DetailMovieViewController()
            detailViewController.id = upComingMovies[indexPath.item].id
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    func fetchUpcomingMovies() {
        UpComingManager.upComingHandler(page: 1) { [weak self] (upComingData, error, statusCode) in
            if let error = error {
                print("Error fetching upcoming movies: \(error)")
            } else {
                if let upComingData = upComingData {
                    self?.upComingMovies = upComingData
                    
                    HomeManager.genreListhandler { [weak self] (genreData, error, statusCode) in
                        if let error = error {
                            print("Error fetching genre data: \(error)")
                        } else {
                            if let genreData = genreData {
                                for (index, movie) in self?.upComingMovies.enumerated() ?? [].enumerated() {
                                    let matchingGenres = genreData.filter { movie.genreIDS.contains($0.id) }
                                    self?.upComingMovies[index].genres = matchingGenres
                                }
                                self?.upComingTableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}
