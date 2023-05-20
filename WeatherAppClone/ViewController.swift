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
    
    private var forecastItems: [ForecaseItemModel] = []
    
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

            let forecastItem = ForecaseItemModel(time: time, condition: .clouds, temperature: Int.random(in: (14..<28)))
            forecastItems.append(forecastItem)
        }

        forecastItems.forEach {
            let forecastView = ForecastItemView()
            forecastView.configure(model: $0)
            forecastStackView.addArrangedSubview(forecastView)
        }
    }
}

