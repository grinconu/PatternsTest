//
//  AbstractFactoryViewController.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 17/04/21.
//

import UIKit

let envitomments = ["Developer","QA","Production"]

class AbstractFactoryViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var enviLabel: UILabel!
    
    //MARK: - Private Properties
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    //MARK: - IBAction
    @IBAction func changeEnv(_ sender: Any) {
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
                
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
    
    //MARK: - Private Methods
    private func setupUI(){
        enviLabel.text = ManagerEnviroment.shared.getEnviromment().description
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
}

extension AbstractFactoryViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return envitomments.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return envitomments[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        enviLabel.text = envitomments[row]
        
        switch row {
        case 0:
            ManagerEnviroment.shared.changeEnviroment(env: .dev)
            return
        case 1:
            ManagerEnviroment.shared.changeEnviroment(env: .qa)
            return
        case 2:
            ManagerEnviroment.shared.changeEnviroment(env: .qa)
            return
        default:
            ManagerEnviroment.shared.changeEnviroment(env: .dev)
        }
    }
}
