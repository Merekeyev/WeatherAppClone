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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    
    private let dataSource: ForecastDataSource = .init()
    
    private var cityModel: CityModel? {
        didSet {
            configureUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundForecastView.backgroundColor = Color.blueBackgroundColor
        backgroundForecastView.layer.cornerRadius = 8
        
        getData()
    }
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        let viewController = CitiesViewController()
        viewController.navigationTitle = "Погода"
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureUI() {
        guard let cityModel = cityModel else { return }
        
        nameLabel.text = cityModel.name
        temperatureLabel.text = cityModel.currentTemperature.withCelcius
        conditionLabel.text = cityModel.condition.text
        
        guard let maxTemperature = cityModel.maxTemperature, let minTemperature = cityModel.minTemperature else { return }
        rangeLabel.text = "Макс.: \(maxTemperature.withCelcius), мин.: \(minTemperature.withCelcius)"
        
        weekForecastStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        cityModel.forecastDays.forEach {
            let dayForecastView = DayForecastView()
            dayForecastView.configure(model: $0)
            weekForecastStackView.addArrangedSubview(dayForecastView)
        }
        
        configureCurrentHoursView()
    }
    
    private func getData() {
        dataSource.getForecast(cityName: cityModel?.name ?? "Almaty", days: 10) { result in
            switch result {
            case .success(let cityModel):
                DispatchQueue.main.async {
                    self.cityModel = cityModel
                }
            case .failure(let error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    
    private func configureCurrentHoursView() {
        guard let cityModel = cityModel else { return }
                
        guard let currentDay = cityModel.forecastDays.first else { return }
         
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let nowTime = dateFormatter.string(from: Date())
        
        guard let currentHourIndex = currentDay.hours.firstIndex(where: {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            guard let date = dateFormatter.date(from: $0.time) else { return false }
            dateFormatter.dateFormat = "HH"
            let loopTime = dateFormatter.string(from: date)
            return loopTime == nowTime
        }) else { return }
        
        var hours: [ForecastHourModel] = []
        for (index, hour) in currentDay.hours.enumerated() {
            if index >= currentHourIndex {
                hours.append(hour)
            }
        }
        
        forecastStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        hours.forEach {
            let forecastItemView = ForecastItemView()
            forecastItemView.configure(model: $0)
            forecastStackView.addArrangedSubview(forecastItemView)
        }
    }
}

extension ViewController: CitiesViewControllerDelegate {
    func didSelectCity(_ city: SearchCityModel) {
        cityModel?.name = city.name
        getData()
    }
}
