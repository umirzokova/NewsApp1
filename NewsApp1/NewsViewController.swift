//
//  NewsViewController.swift
//  NewsApp1
//
//  Created by Nargiz Umirzokova on 17/08/23.
//

import UIKit
//import SnapKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var news: [News.NewsDetails] = []
    //private var news = [NewsTableViewCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = ""
        self.tabBarItem.image = UIImage(systemName: "newspaper")
        
        self.view.addSubview(newsTableView)
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        getNewsFromAPI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Get data from server
    
    private func getNewsFromAPI() {
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2023-08-17&to=2023-08-17&sortBy=popularity&apiKey=71471c2e8ab24c9faed11c1676f2679f"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                 print("Error while decoding", error.localizedDescription)
                 return
        }
              
            guard let data = data, error == nil else {
                print("No data received")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let json = try jsonDecoder.decode(News.self, from: data)
                DispatchQueue.main.async {
                    self.news = json.articles!
                    self.newsTableView.reloadData()
                    print(json.articles)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    //MARK: - LifeCycle of UITableView
    
    private let newsTableView: UITableView = {
        let newsTableView = UITableView()
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        return newsTableView
    }()
    
    override func viewDidLayoutSubviews() {
        newsTableView.frame = view.bounds
    }
    
    // tableView dataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return news.count
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            /*guard */ let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath)
            if let cell = cell as? NewsTableViewCell  {
                cell.setContent(with: news[indexPath.row])
            }
            return cell
        }
}
