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
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = creature.name
        detailLabel.text = creature.detail
        detailLabel.sizeToFit()
        
    }
    
    @IBAction func onEditButtonPressed(_ sender: UIButton) {
            editButton.isHidden = true
            doneButton.isHidden = false
            editTextField.isHidden = false
            detailTextField.isHidden = false
    }
    
    @IBAction func onDoneButtonPressed(_ sender: Any) {
        creature.name = editTextField.text
        creature.detail = detailTextField.text
        editTextField.text = ""
        detailTextField.text = ""
        editButton.setTitle("Edit", for: .normal)
        editTextField.isHidden = true
        detailTextField.isHidden = true
        title = creature.name
        detailLabel.text = creature.detail
        performSegue(withIdentifier: "unwindSegue", sender: nil)
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
