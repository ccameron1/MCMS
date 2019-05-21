//
//  CreatureViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class CreatureViewController: UIViewController {

    var creature : MagicalCreature!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = creature.name
    }
    
    @IBAction func onEditButtonPressed(_ sender: UIButton) {
        if editTextField.isHidden {
            editButton.titleLabel?.text = "Done"
            editTextField.isHidden = false
        } else {
            creature.name = editTextField.text
            editTextField.text = ""
            editButton.titleLabel?.text = "Edit"
            editTextField.isHidden = true
            title = creature.name
        }
        
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
