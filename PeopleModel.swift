//
//  PeopleModel.swift
//  NamePuzzle
//
//  Created by Neil Reisenauer on on 5/24/16.
//  Copyright © 2016 r-neil. All rights reserved.
//

import Foundation

class PeopleModel: JSONHelper{
    /**
     Returns number of rows avaialble for Table View
    */
    func rowCount()->Int{
            return peopleDataArray.count
    }
    /**
     Provides name in "FN LN" format for each cell
     - parameter cellIndex: Cell row as INT
     - returns: String "FN LN"
    */
    func getCombinedNameForRow(cellIndex: Int) ->String{
        let selectedPerson = peopleDataArray[cellIndex]
        return "\(selectedPerson.firstName!) \(selectedPerson.lastName!)"
    }

}