//
//  GenreViewController.swift
//  TestMovie
//
//  Created by Pungki Busneri on 29/01/24.
//

import UIKit

class GenreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var topRatingMovies: UICollectionView!
    @IBOutlet var genresTable: UITableView!
    
    private var topRate = [TopRated]()
    private var genreList = [Genre]()
    private var cellIdentifier = "TopRatingCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topRatingMovies.dataSource = self
        topRatingMovies.delegate = self
        topRatingMovies.register(UINib(nibName: "TopRatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        genresTable.dataSource = self
        genresTable.delegate = self
        genresTable.layer.cornerRadius = 11.0
        genresTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func fetchData() {
        GenreManager.topRatedHandler(page: 1) { data, error, statusCode in
            if let topRatedData = data {
                let topRatedMovies = topRatedData
                
                let sortedMovies = topRatedMovies.sorted { $0.voteAverage > $1.voteAverage }
                
                self.topRate = sortedMovies
                
                DispatchQueue.main.async {
                    self.topRatingMovies.reloadData()
                }
            } else if let error = error {
                print("Error fetching top-rated movies: \(error)")
            }
        }
        
        HomeManager.genreListhandler { [weak self] (genres, error, statusCode) in
            if let genres = genres {
                self?.genreList = genres
                self?.genresTable.reloadData()
            } else {
                print("Error fetching genre list: \(error ?? "Unknown error")")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TopRatingCollectionViewCell
        
        if indexPath.item < topRate.count {
                let movie = topRate[indexPath.item]
                cell.moviesRate.text = "\(movie.voteAverage)"
                cell.movieTitle.text = "\(movie.title)"
                cell.moviesImage.setImage(with: ImageUrl.Poster + movie.posterPath)
        }
            
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if indexPath.item  < topRate.count {
            let detailMovieController = DetailMovieViewController()
            detailMovieController.id = topRate[indexPath.item].id
            navigationController?.pushViewController(detailMovieController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        genreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = genreList[indexPath.row].name
        cell.backgroundColor = .systemPink
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedGenre = genreList[indexPath.row]
        
        let movieWithViewController = MovieWithGenreViewController()
        movieWithViewController.selectedGenre = selectedGenre
        navigationController?.pushViewController(movieWithViewController, animated: true)
    }
}
