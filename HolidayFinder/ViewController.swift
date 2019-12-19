//
//  ViewController.swift
//  HolidayFinder
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var holidayObj = [HolidayDetail]()
    var countycode:String? = "US"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let c_code = countycode else{return}
        let holidayRequest = HolidayService.init(countryCode: c_code)
        holidayRequest.getHolidayData{ [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
                
            case .success(let success):
                self?.holidayObj = success
                 //print(success)
                DispatchQueue.main.async {
                    
                    print(self!.holidayObj)
                }
            }
            
        }
        print(self.holidayObj)
    }

}

