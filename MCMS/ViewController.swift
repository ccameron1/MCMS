//
//  ViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    var creatures : [MagicalCreature] = []
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let creature1 = MagicalCreature(name: "Goblin")
        let creature2 = MagicalCreature(name: "Elf")
        let creature3 = MagicalCreature(name: "Dwarf")
        
        creatures = [creature1, creature2, creature3]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        let creature = creatures[indexPath.row]
        cell?.textLabel?.text = creature.name
        return cell!
    }
    

    @IBAction func onAddButtonPressed(_ sender: UIButton) {
        
        let creature = MagicalCreature(name: "\(nameTextField.text!)")
        
        creatures.append(creature)
        tableView.reloadData()
        nameTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let creature = creatures[indexPath.row]
        let cvc = segue.destination as! CreatureViewController
        cvc.creature = creature
    }
}

