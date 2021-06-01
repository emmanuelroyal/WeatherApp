//
//  WeatherTableViewCell.swift
//  weatherApp
//
//  Created by Decagon on 4/28/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell  {
    
    @IBOutlet var dayLabel: UILabel?
    @IBOutlet var tempLabel: UILabel?
    @IBOutlet var iconImageView: UIImageView!
    
    @IBOutlet weak var tablebackground: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        
    }
    static let identifier = "WeatherTableViewCell"
    
    static func nib()-> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    // MARK:- configure data for display
    func configure(with model: dailyWeather){
        self.tempLabel?.text = "\(Int(model.temp.day))°C"
        self.dayLabel?.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        self.iconImageView.contentMode = .scaleAspectFit
        let summary = model.weather[0].description
        if summary.contains("clear") {
            self.iconImageView.image = UIImage(named:"clear")
        }
        else if summary.contains("rain"){
            self.iconImageView.image = UIImage(named:"rain")
        }
        else{
            self.iconImageView.image = UIImage(named:"partlysunny")
        }
        let background = model.weather[0].description
        if background.contains("clear") {
            self.tablebackground.backgroundColor = UIColor.green
        }
        else if background.contains("rain"){
            self.tablebackground.backgroundColor = UIColor.gray
        }
        else{
            self.tablebackground.backgroundColor =
                UIColor.darkGray
        }
    }
    func getDayForDate(_ date:Date?)->String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate )
    }
}
