//
//  CityTableViewCell.swift
//  WeatherAppClone
//
//  Created by Temirlan on 27.05.2023.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.blueMainBackgroundColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private let weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28)
        label.textColor = .white
        return label
    }()
    
    private let temperatureRangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    func configure(with city: CityModel) {
//        nameLabel.text = city.name
//        timeLabel.text = city.time
//        weatherConditionLabel.text = city.weatherCondition.condition
//        temperatureLabel.text = city.currentTemperature.withTemperature
//        temperatureRangeLabel.text = "Макс.: \(city.maximumTemperature.withTemperature), мин.: \(city.minimumTemperature.withTemperature)"
        nameLabel.text = city.name
        temperatureLabel.text = city.currentTemperature.withCelcius
        weatherConditionLabel.text = city.condition.text
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .black
        
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        containerView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12)
        ])
        
        containerView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ])
        
        containerView.addSubview(weatherConditionLabel)
        NSLayoutConstraint.activate([
            weatherConditionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            weatherConditionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        containerView.addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            temperatureLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor)
        ])
        
        containerView.addSubview(temperatureRangeLabel)
        NSLayoutConstraint.activate([
            temperatureRangeLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
            temperatureRangeLabel.bottomAnchor.constraint(equalTo: weatherConditionLabel.bottomAnchor)
        ])
    }
}
