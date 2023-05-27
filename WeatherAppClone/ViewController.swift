//
//  ViewController.swift
//  WeatherAppClone
//
//  Created by Temirlan on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forecastStackView: UIStackView!
    @IBOutlet weak var backgroundForecastView: UIView!
    @IBOutlet weak var backgroundWeekForecastView: UIView!
    @IBOutlet weak var weekForecastStackView: UIStackView!
    @IBOutlet weak var menuButton: UIButton!
    
    private var forecastItems: [ForecaseItemModel] = []
    private var weekDays: [Week] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundForecastView.backgroundColor = Color.blueBackgroundColor
        backgroundForecastView.layer.cornerRadius = 8
        
        (0..<24).forEach {
            var time: String
            var currentDate = Date()
             var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            var timeDuration = dateFormatter.string(from: currentDate)

            if Int(timeDuration) == $0 {
                time = "Сейчас"
            } else {
                time = $0 < 10 ? "0\($0)" : "\($0)"
            }

            let forecastItem = ForecaseItemModel(time: time, condition: .clouds, temperature: Int.random(in: (14..<28)), isCurrent: Int(timeDuration) == $0)
            forecastItems.append(forecastItem)
        }
        
        forecastItems.sort(by: { $0.isCurrent != $1.isCurrent })

        forecastItems.forEach {
            let forecastView = ForecastItemView()
            forecastView.configure(model: $0)
            forecastStackView.addArrangedSubview(forecastView)
        }
        
        backgroundWeekForecastView.layer.cornerRadius = 8
        weekForecastStackView.backgroundColor = .clear
        
        var counter = 1
        (0..<25).forEach {
            counter = $0 - (7 * counter) > 6 ? counter + 1 : counter
            let rawValue = $0 - (7 * counter) < 0 ? $0 : $0 - (7 * counter)
            weekDays.append(Week(rawValue: rawValue)!)
        }
        
        weekDays.forEach {
            let dayForecastModel = DayForecastModel(day: $0.shortName,
                                                    weatherCondition: .clouds,
                                                    minTemperature: 17,
                                                    maxTemperature: 27)
            let dayForecastView = DayForecastView()
            dayForecastView.configure(model: dayForecastModel)
            weekForecastStackView.addArrangedSubview(dayForecastView)
        }
    }
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        print("Menu button was tapped")
    }
    
}
