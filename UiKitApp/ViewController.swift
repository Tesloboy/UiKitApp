//
//  ViewController.swift
//  UiKitApp
//
//  Created by Viktor Teslenko on 20.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider! 
    @IBOutlet var textField: UITextField!
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchForm: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK : Segment Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // MARK: Label
        
        //изменим такст
        mainLabel.text = ""
        //изменим размер шрифта
        mainLabel.font = mainLabel.font.withSize(30)
        //изменим расположение текста
        mainLabel.textAlignment = .center
        //установим ограничение строк (если 0 то будут неограничены)
        mainLabel.numberOfLines = 2
        
        // MARK: Slider
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
       // mainLabel.text = String(slider.value)
     
        // MARK: TextField
        textField.backgroundColor = .white
        //если нужно чтобы пользователь мог вводить только цифры
        //textField.keyboardType = .numberPad
        
        // MARK: Button
        mainButton.layer.cornerRadius = 10
        mainButton.setTitle("Готово", for: .normal)
        
        // MARK: DatePicker
        
    }

    @IBAction func segmentedControlAction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран сегмент с индексом 0"
            mainLabel.textColor = .yellow
        case 1:
            mainLabel.text = "Выбран сегмент с индексом 1"
            mainLabel.textColor = .red
        case 2:
            mainLabel.text = "Выбран сегмент с индексом 2"
            mainLabel.textColor = .purple
        default:  break
        }
    }
       
    @IBAction func sliderAction() {
        mainLabel.text = String(Int(slider.value))
    }
    
    @IBAction func mainButtonAction(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }             //можно было через if let
            mainLabel.text = text
        }

    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = . full
        mainLabel.text = dateFormatter.string(from:  datePicker.date)
    }
    
    //экшн от свича - отключать все переключатели
    @IBAction func toggleElements(_ sender: Any) {
//switchForm.isOn  - свич в значении вкл
//зделаем эл-ты скрытыми и присвоим им обратное от свича значение
        
        segmentedControl.isHidden = !switchForm.isOn
        mainLabel.isHidden = !switchForm.isOn
        slider.isHidden = !switchForm.isOn
        textField.isHidden = !switchForm.isOn
        mainButton.isHidden = !switchForm.isOn
        datePicker.isHidden = !switchForm.isOn
    }
    
    
}


