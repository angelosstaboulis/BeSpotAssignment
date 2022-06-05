//
//  Repository.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 5/6/22.
//

import Foundation
import Alamofire
import SwiftyJSON
class Repository{
    static let shared = Repository()
    private init(){}
    func fetchGeoInfo(completion:@escaping ([Model])->()){
        let mainUrl = URL(string: "https://private-7c6af2-bespotassessmentapi.apiary-mock.com/api/places")
        let request = URLRequest(url: mainUrl!)
        AF.request(request).responseData { dataResponse in
        switch (dataResponse.result){
            case .success(_):
                do{
                    let decode = try JSONDecoder().decode([Model].self, from: dataResponse.data!)
                    completion(decode)
                }
                catch{
                    debugPrint((error.localizedDescription))
                }
            case .failure(let error):
                debugPrint("something went wrong=",error.localizedDescription)
                
                
            }
            
        }
    }
}
