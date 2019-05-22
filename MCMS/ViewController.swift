//
//  ViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
   
    

    @IBOutlet weak var imgPickImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    var creatures : [MagicalCreature] = []
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var accessoryTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var indexPath : IndexPath = []
    var imgPickForCreature : UIImage?
    var viewOfImage : UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        let creature1 = MagicalCreature(name: "Goblin", detail: "Green", image: UIImage(named: "goblin")!, accessory: "Club")
        let creature2 = MagicalCreature(name: "Elf", detail: "Pointy Ears", image: UIImage(named: "elf")!, accessory: "Ear Shaped Knives")
        let creature3 = MagicalCreature(name: "Dwarf", detail: "Short", image: UIImage(named: "dwarf")!, accessory: "Pick Ax")
        
        creatures = [creature1, creature2, creature3]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        let creature = creatures[indexPath.row]
        cell?.textLabel?.text = creature.name
        cell?.detailTextLabel?.text = "\(creature.detail!)\n\(creature.accessory!)"
        //imgPick = cell?.imageView?.image
        cell?.imageView?.image = creature.image
        return cell!
    }
    

    @IBAction func onAddButtonPressed(_ sender: UIButton) {
        print("new")
        let creature = MagicalCreature(name: "\(nameTextField.text!)", detail: "\(detailTextField.text!)", image: imgPickForCreature!, accessory: "\(accessoryTextField.text!)")
        
        creatures.append(creature)
        tableView.reloadData()
        nameTextField.text = ""
        detailTextField.text = ""
        accessoryTextField.text = ""
        
        print(creatures[3].image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is CreatureViewController {
        indexPath = tableView.indexPathForSelectedRow!
        let creature = creatures[indexPath.row]
        let cvc = segue.destination as! CreatureViewController
            cvc.creature = creature
        } else {
//            indexPath = tableView.indexPathForSelectedRow!
//            let creature = creatures[indexPath.row]
            let bvc = segue.destination as! BattleViewController
            //bvc.creature = creature
            bvc.creatures = creatures
           // bvc.indexPath = indexPath
        }
    }
    
    @IBAction func onFightButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func unwindtoTableVC(segue: UIStoryboardSegue){
        
        if segue.source is CreatureViewController {
            if let senderVC = segue.source as? CreatureViewController{
                creatures[indexPath.row] = senderVC.creature
            }
            tableView.reloadData()
        }
        else {
            //do nothing
        }
    }
    @IBAction func chooseImageButton(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            print("Button capture")
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.photoLibrary;
            //imag.mediaTypes = [kUTTypeImage];
            imag.allowsEditing = false
            self.present(imag, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        
        // Set photoImageView to display the selected image.
        //imgPickImageView.image = selectedImage
        //creatures[0].image = selectedImage
        imgPickForCreature = selectedImage
        //tableView.reloadData()
        
        
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}

