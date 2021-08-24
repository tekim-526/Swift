//
//  ViewController.swift
//  MovieApplication
//
//  Created by Kim TaeSoo on 2021/08/24.
//
// API를 사용하기 위해서는 postman이라는 걸 사용해서 json파일에서 가져와야함?
import UIKit

class ViewController: UIViewController {

    var movieModel: MovieModel?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        requestMovieAPI()
        
    }
    
    // 네트워크 호출
    func requestMovieAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        // 기본 주소값 설정
        var components = URLComponents(string: "https://itunes.apple.com/search")
        // marvel 대신에 받아올 값이 들어가야함
        let term = URLQueryItem(name: "term", value: "marvel")
        let media = URLQueryItem(name: "media", value: "movie")
        components?.queryItems = [term, media]
        // componets?.queryItems에 값을 넣어주면 "https://itunes.apple.com/search?term=marvel&media=movie"와 같은 말이됨
        
        // 주소를 가져옴
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //httpMethod가 무엇인지 검색해보자
        
        // 제일 중요!!
        session.dataTask(with: request) { data, response, error in
            // statuscode는 404에러, 200번대 이면 제대로 간다 등등
            print( (response as! HTTPURLResponse).statusCode )
            // 인코딩 디코딩 검색 해보자, try는 do catch 사이에 들어가 있어야함
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    print(self.movieModel ?? "No Data")
                }
                catch {
                    print (error)
                }
            }
        }.resume()// resume실행하는 키워드 상수로 받아서 상수명.resume()도 가능
        // 끝내는 키워드
        session.finishTasksAndInvalidate()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        return cell
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
