//
//  HolidayService.swift
//  HolidayFinder
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

enum HolidayError :Error{
    case NoDataAvailable
    case IncorrectRequest
    case FetchingError
    case CannotProceedWithData
}
struct HolidayService {
    let resoureURL : URL
    let apikey = "0a2425a05d103efd7fb18136b90f834a3e11d628"
    
    init(countryCode:String) {
        //
      let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        let resouceString = "https://calendarific.com/api/v2/holidays?api_key=\(apikey)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceurl = URL(string: resouceString) else{ fatalError()}
        resoureURL = resourceurl
        
    }
    
    func getHolidayData(completion:@escaping(Result<[HolidayDetail],HolidayError>) -> Void)
    {
        let dataTask = URLSession.shared.dataTask(with: resoureURL) {data ,_ , _ in
            
            print(self.resoureURL)
            guard let jsonData = data else {
                completion(.failure(HolidayError.NoDataAvailable))
                return
            }
            do{
                let decodeData = JSONDecoder()
                let holidayResponse = try? decodeData.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidayResponse?.response.holidays
                completion(.success(holidayDetails!))
            }catch{
                completion(.failure(HolidayError.CannotProceedWithData))
            }
        }
        dataTask.resume()
    }
}
