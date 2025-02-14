//
//  AddRecipeViewController.swift
//  Barman
//
//  Created by OYuuyuMP on 26/10/24.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var txtDrinkName: UITextField!
    
    @IBOutlet weak var txtIngredients: UITextField!
    
    @IBOutlet weak var txtInstructions: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        var msg: String = ""
        
        guard let name = txtDrinkName.text,
              let ingredients = txtIngredients.text,
              let instructions = txtInstructions.text
        else { return }
        
        if name.isEmpty {
            msg += "Please enter a name for the recipe.\n"
        }
        if ingredients.isEmpty {
            msg += "Please enter ingredients for the recipe.\n"
        }
        if instructions.isEmpty {
            msg += "Please enter instructions for the recipe.\n"
        }
        
        
        if msg.isEmpty {
            let newRecipe: [[String: Any]] = [["name": name, "ingredients": ingredients, "directions": instructions, "img": ""]]
            
            DataManager.shared.saveRecipes(newRecipe)
            //Notificamos al controlador para que actualice
            NotificationCenter.default.post(name: NSNotification.Name("RecipeSaved"), object: nil)
            navigationController?.popViewController(animated: true)
        }else{
            print(msg)
        }
    }

}
