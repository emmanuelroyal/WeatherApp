//
//  ViewController.swift
//  weatherApp
//
//  Created by Decagon on 4/25/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let image = daily[0].weather.description
     @IBOutlet var table: UITableView!
        
    
    @IBOutlet weak var headerTemp: UILabel!
    @IBOutlet weak var headerDesc: UILabel!
    @IBOutlet weak var consoleHeader: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet weak var consoleBackground: UIStackView!
    @IBOutlet weak var viewBackground: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        getData()
    
    DispatchQueue.main.async {
        self.table.reloadData()
        
        if image.contains("rain") {
            self.headerImage.image = UIImage(named:"forest_rainy")
            self.viewBackground.backgroundColor = .gray
            self.consoleBackground.backgroundColor = .gray
        }
        else if image.contains("clear"){
            self.headerImage.image = UIImage(named:"forest_sunny")
            self.viewBackground.backgroundColor = .green
            self.consoleBackground.backgroundColor = .green
        }
        else{
            self.headerImage.image = UIImage(named:"forest_cloudy")
            self.viewBackground.backgroundColor = .darkGray
            self.consoleBackground.backgroundColor = .darkGray
        }
        
    }
    
    }
            
        
        

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count - 3
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}


