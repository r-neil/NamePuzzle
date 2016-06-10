//
//  MainViewControllerTests.swift
//  NamePuzzle
//
//  Created by Reisenauer, Neil (Contractor) on 5/25/16.
//  Copyright © 2016 r-neil. All rights reserved.
//

import XCTest
@testable import NamePuzzle

class MainViewControllerTests: XCTestCase {

    /**
     Class Mocks MainViewController to use in testing.
    */
    class TestMainViewController : FormViewController{
        let testFirstNameInput = UITextField()
        let testLastNameInput = UITextField()
        let testsayHiButton = UIButton()
        let testDisplayNameLabel = UILabel()
        let testFormatToggle = UISegmentedControl.init(items: ["0","1"])
        
        override internal var firstNameInput: UITextField!{
            get{
                return testFirstNameInput
            }
            set{
                
            }
        }
        override internal var lastNameInput: UITextField!{
            get{
                return testLastNameInput
            }
            set{
                
            }
        }
        
        override internal var sayHiButton: UIButton!{
            get{
                return testsayHiButton
            }
            set{
                
            }
        }
        override internal var displayNameLabel: UILabel!{
            get{
                return testDisplayNameLabel
            }
            set{
                
            }
        }
        override internal var formatToggle: UISegmentedControl!{
            get{
                return testFormatToggle
            }
            set{
                
            }
        }
        
    }
    
    func testFullName_FirstName_space_LastNameFormat(){
        
        let testFirstName = "Neil"
        let testLastName = "Reisenauer"
        let MainVCTotest = TestMainViewController()
        MainVCTotest.viewDidLoad()
        MainVCTotest.firstNameInput.text = testFirstName
        MainVCTotest.lastNameInput.text = testLastName
        MainVCTotest.formatToggle.selectedSegmentIndex = 0
        MainVCTotest.sayHiButtonAction()
        XCTAssertEqual("Hi \(testFirstName) \(testLastName)", MainVCTotest.displayNameLabel.text)
        }
    
    func testFullName_LastName_comma_FirstNameFormat(){
        
        let testFirstName = "Neil"
        let testLastName = "Reisenauer"
        let MainVCTotest = TestMainViewController()
        MainVCTotest.viewDidLoad()
        MainVCTotest.firstNameInput.text = testFirstName
        MainVCTotest.lastNameInput.text = testLastName
        MainVCTotest.formatToggle.selectedSegmentIndex = 1
        MainVCTotest.sayHiButtonAction()
        XCTAssertEqual("Hello \(testLastName), \(testFirstName)", MainVCTotest.displayNameLabel.text)
    }

}
