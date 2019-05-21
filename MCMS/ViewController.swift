//
//  ViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var detailTextField: UITextField!
    var creatures : [MagicalCreature] = []
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var indexPath : IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        let creature1 = MagicalCreature(name: "Goblin", detail: "Green", image: UIImage(named: "goblin"))
        let creature2 = MagicalCreature(name: "Elf", detail: "Pointy Ears", image: UIImage(named: "elf"))
        let creature3 = MagicalCreature(name: "Dwarf", detail: "Short", image: UIImage(named: "dwarf"))
        
        creatures = [creature1, creature2, creature3]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        let creature = creatures[indexPath.row]
        cell?.textLabel?.text = creature.name
        cell?.detailTextLabel?.text = creature.detail
        cell?.imageView?.image = creature.image
        return cell!
    }
    

    @IBAction func onAddButtonPressed(_ sender: UIButton) {
        
        let creature = MagicalCreature(name: "\(nameTextField.text!)", detail: "\(detailTextField.text!)", image: UIImage(named: "questionmark"))
        
        creatures.append(creature)
        tableView.reloadData()
        nameTextField.text = ""
        detailTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        indexPath = tableView.indexPathForSelectedRow!
        let creature = creatures[indexPath.row]
        let cvc = segue.destination as! CreatureViewController
        cvc.creature = creature
    }
    
    @IBAction func unwindtoTableVC(segue: UIStoryboardSegue){
        if segue.source is CreatureViewController {
            if let senderVC = segue.source as? CreatureViewController{
                creatures[indexPath.row] = senderVC.creature
            }
            tableView.reloadData()
        }
    }
    
}

