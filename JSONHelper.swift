//
//  JSONHelper.swift
//  NamePuzzle
//
//  Created by Neil Reisenauer on 5/24/16.
//  Copyright © 2016 r-neil. All rights reserved.
//

import Foundation

protocol gitHubData{
    func peopleDataReady()
}

///Class fetches data from GitHub souce during init
///Data available in peopleDataArray
class JSONHelper{
    
    var gitHubDataDelegate : gitHubData?
    
    //Using struct to as way to store data from API
    struct PeopleDataStruct{
        let firstName : String?
        let lastName : String?
    }
    var peopleDataArray = Array<PeopleDataStruct>()
    
    //Sets up API URL.
    private let APIStr = "https://gist.githubusercontent.com/zorn/6572637c1a1cbb89d4c9/raw/88c80043d4bf6d0feac11de9a575db4573a9b024/people.json"
    private var gitHubAPIURL : NSURL{
        get{
            return NSURL(string: APIStr)!
        }
    }
    
    init(){
        fetchJSONData()
    }
    
    private func fetchJSONData(){
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(gitHubAPIURL) { (data, response, error) in
            if data != nil{
                do{
                    let peopleData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    guard let peopleDataDictionary = peopleData as? NSDictionary
                    else{
                        print("data cannot be converted to NSDictionary")
                        return
                    }
                    self.createPeopleDictionary(peopleDataDictionary)
                }
                catch{
                    print("data error with GitHub API")
                }
            }else{
                print("no data from source")
            }
        }
        dataTask.resume()
    }
    
    //Keys from GitHub API.
    private struct APIKeys{
        static let people = "people"
        static let fName = "first_name"
        static let lName = "last_name"
    }
    
    private func createPeopleDictionary(data: NSDictionary){
        if let tempArrayofPeople = data.valueForKey(APIKeys.people) as? NSArray{
            for people in tempArrayofPeople{                
                let firstName = people.valueForKey(APIKeys.fName) as? String ?? " "
                let lastName = people.valueForKey(APIKeys.lName) as? String ?? " "
                peopleDataArray.append(PeopleDataStruct(firstName: firstName, lastName: lastName))
            }
        }
        gitHubDataDelegate?.peopleDataReady()
    }
}