//
//  ViewController.swift
//  HolidayFinder
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var hdayTableView: UITableView!
    
    var holidayObj = [HolidayDetail](){
        didSet{
            
            DispatchQueue.main.async {
                self.hdayTableView.reloadData()
                self.navigationItem.title = " \(self.holidayObj.count) / Holiday Found"
            }
        }
    }
    var countycode:String? = "US"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countrySearchBar.delegate = self
        hdayTableView.delegate = self
    
        print(self.holidayObj)
    }
}

extension ViewController : UITableViewDataSource ,UITableViewDelegate, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.holidayObj.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell", for: indexPath) as! HolidayCell
           let holiday = self.holidayObj[indexPath.row]
           cell.hnameLbl.text = holiday.name
           cell.hdateLbl.text = holiday.date.iso
           // cell.hdescLbl.text = holiday.description
           return cell
          }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    
    
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          
       }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
         guard let searchTxt = searchBar.text else {
                      return
                  }
                  let holidayRequest = HolidayService.init(countryCode: searchTxt)
                  holidayRequest.getHolidayData{ [weak self] result in
                      switch result{
                      case .failure(let error):
                          print(error)
                          
                      case .success(let success):
                          self?.holidayObj = success
                           //print(success)
                          
                      }
                      
                  }
            }
}
