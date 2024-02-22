//
//  MovieWithGenreViewController.swift
//  TestMovie
//
//  Created by Pungki Busneri on 19/02/24.
//

import UIKit

class MovieWithGenreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var listMovieWithGenre: UITableView!
    
    private var movieList = [MovieWithGenreModel]()
    private var genreList = [Genre]()
    private var cellIdentifier = "MyTableViewCell"
    
    var selectedGenre: Genre? {
            didSet {
                fetchData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataMovie()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchDataMovie() {
        listMovieWithGenre.dataSource = self
        listMovieWithGenre.delegate = self
        listMovieWithGenre.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        getDataGenreList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
        cell.setupCell(movie: movieList[indexPath.row], genre: genreList)
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let detailMovieViewController = DetailMovieViewController()
            detailMovieViewController.id = movieList[indexPath.row].id
            navigationController?.pushViewController(detailMovieViewController, animated: true)
        }
    }
extension MovieWithGenreViewController {
    func fetchData() {
        
        guard let selectedGenreId = selectedGenre?.id else {
            return
        }
        
        MovieListWithGenreManager.moviesWithGenresHandler(page: 1, genreID: selectedGenreId) { data, error, statusCode in
            if let movieListData = data {
                self.movieList = movieListData.filter { $0.genreIDS.contains(selectedGenreId) }
                self.listMovieWithGenre.reloadData()
            } else if let error = error {
                print("Error fetching movie list by genre: \(error)")
            }
        }
    }
    private func getDataGenreList() {
        HomeManager.genreListhandler { data, error, statusCode in
            
            if error != nil {
                
            } else {
                guard let result = data else { return }
                self.genreList = result
            }
        }
    }
}
