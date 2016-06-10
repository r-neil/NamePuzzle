//
//  FormViewController.swift
//  NamePuzzle
//
//  Created by Neil Reisenauer on 5/24/16.
//  Copyright © 2016 r-neil. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var formatToggle: UISegmentedControl!
    @IBOutlet weak var sayHiButton: UIButton!
    @IBOutlet weak var displayNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func sayHiButtonAction() {
        let userSelectedFormat = formatToggle.selectedSegmentIndex
        displayNameLabel.text = fullNameGeneratorWithSelectedFormat(userSelectedFormat)
    }
    
    /**
     Used to setup view during inital load
     */
    
    private func setupView(){
        sayHiButton.enabled = false
        firstNameInput.delegate = self
        lastNameInput.delegate = self
        displayNameLabel.text = " "
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
    }
    
    /**
     Checks if name fields are blank. If not blank, enable sayHiButton
     */
    private func checkNameFields(){
        if (firstNameInput.text?.characters.count > 0 && lastNameInput.text?.characters.count > 0){
            sayHiButton.enabled = true
        } else{
            sayHiButton.enabled = false
        }
    }
    
    //MARK: FULL NAME GENERATOR METHOD
    /**
     Method combines first name and last name into one string.
     
     - parameter selectedFormatInt: 0 for "FN LN", 1 for "LN, FN"
     - returns: combined string
     
     */
    internal func fullNameGeneratorWithSelectedFormat(selectedFormatInt : Int)->String{
        switch selectedFormatInt{
        case 0:
            return "Hi " + firstNameInput.text! + " " + lastNameInput.text!
        case 1:
            return "Hello " + lastNameInput.text! + ", " + firstNameInput.text!
        default:
            return ""
        }
    }
    
    //Keyboard delegate method.
    //Selecting "next" on FirstNameTextField will move focus to LastNameTextField
    //Selecting "done" on LastNameTextField will dismiss keyboard and perform checkNameField()
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0  {
            lastNameInput.becomeFirstResponder()
        }
        else{
            view.endEditing(true)
            checkNameFields()
        }
        return true
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
        checkNameFields()
    }
}
