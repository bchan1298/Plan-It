//
//  DetailViewController.swift
//  Plan It
//
//  Created on 5/21/2017.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var importantSwitch: UISwitch!
    @IBOutlet var datePicker: UIDatePicker!
    
    var event: Event! {
        didSet {
            navigationItem.title = event.name
        }
    }
    
    func configureView() {
        print(#function)
        if let detail = self.event {
            if let nameField = self.nameTextField {
                nameField.text = detail.name
            }
            if let locField = self.locationField {
                locField.text = detail.location
            }
            if let alaSwitch = self.alarmSwitch {
                alaSwitch.isOn = detail.alarm
            }
            if let impoSwitch = self.importantSwitch {
                impoSwitch.isOn = detail.important
            }
            if let datePick = self.datePicker {
                datePick.date = detail.date
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        event.name = nameTextField.text ?? ""
        event.location = locationField.text ?? ""
        event.important = importantSwitch.isOn
        event.alarm = alarmSwitch.isOn
        event.date = datePicker.date
        
        
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
}
