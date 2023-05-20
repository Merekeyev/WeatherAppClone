//
//  CurrentTemperatureView.swift
//  WeatherAppClone
//
//  Created by Temirlan on 14.05.2023.
//

import UIKit

class CurrentTemperatureView: UIView {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    
//    private func commonInit() {
//        
//    }
    
    func configure(model: CurrentTemperatureModel) {
//        cityNameLabel.text = model.city
//        currentTemperatureLabel.text = model.temperature.withTemperature
//        conditionLabel.text = model.condition
//        rangeLabel.text = model.temperatureRange
        backgroundColor = .red
    }
}
