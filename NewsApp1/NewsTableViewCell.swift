//
//  NewsTableViewCell.swift
//  NewsApp1
//
//  Created by Nargiz Umirzokova on 18/08/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let newsTitles = UILabel()
        //newsTitles.numberOfLines = 0
        newsTitles.font = .systemFont(ofSize: 25, weight: .medium)
        //newsTitles.backgroundColor = .blue
        return newsTitles
    }()
    
    private var newsDescriptionLabel: UILabel = {
        let newsDescription = UILabel()
        //newsDescription.numberOfLines = 0
        newsDescription.font = .systemFont(ofSize: 18, weight: .regular)
        //newsDescription.backgroundColor = .red
        return newsDescription
    }()
    
    private let newsImageView: UIImageView = {
        let newsImages = UIImageView()
        newsImages.contentMode = .scaleAspectFill
        //newsImages.backgroundColor = .green
        return newsImages
    }()
    
    func setContent(with news: News.NewsDetails)  {
        //
        newsTitleLabel.text = news.title
        newsDescriptionLabel.text = news.description
        
        
        /*guard let url = URL(string: news.image) else {
            return
        }
        
        fetchURLImage(with: url)*/
        // imageView
//        if let imageViewName = news.image {
//            guard let newsImageUrl = URL(string: imageViewName) else {
//                return
//            }
//            URLSession.shared.dataTask(with: newsImageUrl) { data, response, error in
//                if let error = error {
//                    print("Error while image received")
//                    return
//                }
//
//                guard let data = data, error == nil else {
//                    print("No data received")
//                    return
//                }
//                let jsonDecoders = JSONDecoder()
//                do {
//                    let json = try jsonDecoders.decode(News.NewsDetails.self, from: data)
//                    DispatchQueue.main.async {
//                        self.news = json.image
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }.resume()
//        }

        
    }
    
    private func fetchURLImage(with url: URL) {
//        let newImageUrl = url
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                print("Error while image received")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let json = try jsonDecoder.decode(News.NewsDetails.self, from: data!)
                
                guard let imageUrlString = json.image, let url = URL(string: imageUrlString) else {
                    return
                }
                
                DispatchQueue.main.async {
                    
                    let data = try? Data(contentsOf: url)
                    if let imageViewData = data {
                        print(imageViewData)
                      let image = UIImage(data: imageViewData)
                    }
                    //self.newsImageView.image = UIImage(data: date)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
        
        /*if let imageName = news.image {
         // zdelat zapros
         let imagesUrl = news.url
         let imageUrl = imagesUrl {
         return
         }
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: imagesUrl) {
         (data, response, error) in
         
         // poluchit kartinku
         guard let data = data, error == nil else {
         return
         }
         DispatchQueue.main.async {
         self.imageView?.image = UIImage(data: data)
         }
         
         }task?.resume()
         
         //guard let data = data, error
         }*/
        
    
    
    // poluchennuu kartinki pededat v imageview
    // newsImageView.image = image
    
    override func setNeedsUpdateConstraints() {
    }
    
    //    var news: NewsDetails? {
    //        didSet {
    //            guard let news = news else {
    //                return
    //            }
    //            // zapolnenie
    //            newsTitleLabel.text = news.title
    //            setNeedsUpdateConstraints()
    //        }
    //    }
    
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = .blue
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsDescriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLabel.frame = CGRect(x: 10,
                                      y: 0,
                                      width: contentView.frame.size.width-170,
                                      height: 70
        )
        
        newsDescriptionLabel.frame = CGRect(x: 10,
                                            y: 70,
                                            width: contentView.frame.size.width-170,
                                            height: contentView.frame.size.height / 2
        )
        
        newsImageView.frame = CGRect(x: contentView.frame.size.width-160,
                                     y: 5,
                                     width: 160,
                                     height: contentView.frame.size.height-10
        )
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLabel.text = nil
        newsDescriptionLabel.text = nil
        newsImageView.image = nil
    }
    
}
    /*func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        newsDescriptionLabel.text = viewModel.description
        
        //image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageUrl {
            //fetch
            //URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        }
    }*/
