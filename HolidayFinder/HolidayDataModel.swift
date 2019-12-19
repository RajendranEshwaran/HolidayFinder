//
//  HolidayDataModel.swift
//  HolidayFinder
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var response:Holidays
}
struct Holidays:Decodable{
    var holidays:[HolidayDetail]
}
struct HolidayDetail:Decodable {
    var name:String
    var date:DateInfo
}
struct DateInfo:Decodable{
    var iso:String
}
