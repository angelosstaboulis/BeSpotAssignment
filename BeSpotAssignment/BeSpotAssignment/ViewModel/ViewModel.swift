//
//  ViewModel.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 5/6/22.
//

import Foundation
protocol ReloadDataDelegate:AnyObject{
    func reloadData()
}
class ViewModel{
    weak var delegate:ReloadDataDelegate?
    var apishared:Repository
    var arrayGeoInfo:[Model]=[]
    init(){
        apishared = Repository.shared
    }
    func fetchGeoInfo(){
        apishared.fetchGeoInfo { arrayGeoInfo in
            self.arrayGeoInfo = arrayGeoInfo
            self.delegate?.reloadData()

        }
    }
}
