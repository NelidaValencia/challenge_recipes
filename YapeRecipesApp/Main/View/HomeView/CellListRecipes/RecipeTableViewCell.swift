//
//  RecipeTableViewCell.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 18/05/23.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var nameRecipe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
