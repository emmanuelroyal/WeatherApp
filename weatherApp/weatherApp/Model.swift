//
//  Model.swift
//  weatherApp_week_6
//
//  Created by Decagon on 5/3/21.
//

import Foundation
 var models = [dailyWeather]()
public func getData(){
    let url = "https://api.openweathermap.org/data/2.5/onecall?lat=6.5833&lon=3.75&appid=6371cf46264b54f45ffde26f4ec803ad&exclude=hourly&units=metric"
    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in
        guard let data = data, error == nil else{
            print ("Could not get any data")
            return
        }
        var json:WeatherResponse?
        do{
            json = try JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        catch{
            print("error:\(error)")
        }
         guard let result = json else {
            return
        }
        
        let entries = result.daily
        let currentTemp = result.current.temp
        let summary = result.current.weather[0].description.uppercased()
        let min = result.daily[0].temp.min
        let max = result.daily[0].temp.max
        let image = result.daily[0].weather.description
        models.append(contentsOf:entries)
       
        var modelHeaderTemp = "\(Int(currentTemp))ᴼ"
        var modelHeaderDesc = summary
        var modelConsoleHeader = "\(Int(currentTemp))ᴼC"
        var modelMinTemp = "\(Int(min))ᴼC"
        var modelmaxTemp = "\(Int(max))ᴼC"
           
        
    })
    
    task.resume()
}
public struct WeatherResponse: Codable {
    let current: currentWeatherObject
    let daily: [dailyWeather]
}
struct currentWeatherObject : Codable {
    let dt: Int
    let temp: Double
    let weather: [weatherValues]
}
struct dailyWeather: Codable {
    let dt: Int
    let temp: tempObject
    let weather: [weatherValues]
}
struct tempObject: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}
struct weatherValues: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

