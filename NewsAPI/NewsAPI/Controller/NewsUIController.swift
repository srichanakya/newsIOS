//
//  NewsUIController.swift
//  NewsAPI
//
//  Created by Sri Chanakya Yennana on 10/14/22.
//

import UIKit

class NewsUIController: UIViewController, NewsManagerDelegate {
    func updateNewsOnUI(title: String, body: String, img: String) {
        DispatchQueue.main.async { [self] in
            // Access UI stuff here
            
            var url = URL(string: img)
            guard let imageData = try? Data(contentsOf: url!) else { return }

            let image = UIImage(data: imageData)
            Header.text = title
            Body.text =  body
            Pic.image = image
        }
    }
    
    @IBOutlet weak var Pic: UIImageView!
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var Body: UILabel!
    var category : String = ""
    var apibrain = APIBrain()
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apibrain.callAPI(category)
        var nextNews = UISwipeGestureRecognizer(target: self, action: #selector(getNews))
        nextNews.direction = .up
        self.view.addGestureRecognizer(nextNews)
        var previousNews = UISwipeGestureRecognizer(target: self, action: #selector(getPreviousNews))
        previousNews.direction = .down
        self.view.addGestureRecognizer(previousNews)
        apibrain.delegate = self
        
        
        var back = UISwipeGestureRecognizer(target: self, action: #selector(goback))
        back.direction = .right
        self.view.addGestureRecognizer(back)
    }
    
   
    @objc func goback(){
        self.dismiss(animated: true)
    }
    
    @objc func getNews(){
        print(category)
        apibrain.newNews(count)
        count += 1
        
        print(count)
    }
    @objc func getPreviousNews(){
        print(category)
        apibrain.newNews(count)
        if (count > 0) {
            count -= 1}
        
        print(count)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
