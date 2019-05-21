//
//  MagicalCreature.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation
import UIKit

class MagicalCreature {
    
    var name : String!
    var detail : String!
    var image : UIImage?
    
    init(name : String, detail : String, image: UIImage?) {
        self.name = name
        self.detail = detail
        self.image = image
    }
}
