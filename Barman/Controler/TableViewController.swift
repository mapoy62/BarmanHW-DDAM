//
//  TableViewController.swift
//  Barman
//
//  Created by OYuuyuMP on 25/10/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registra el observador solo una vez
        NotificationCenter.default.addObserver(self, selector: #selector(showTable), name: NSNotification.Name("RecipeSaved"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(connectionStatusChanged), name: NSNotification.Name("ConnectionStatusChanged"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recipes = DataManager.shared.getAllDrinks()
        //NotificationCenter.default.addObserver(self, selector: #selector(showTable), name:NSNotification.Name(rawValue: "Data Loaded"), object: nil)
    }
    
    @objc func showTable() {
        recipes = DataManager.shared.getAllDrinks()
        print("Showing Table")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        performSegue(withIdentifier: "showRecipeDetails", sender: recipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetails" {
            let destino = segue.destination as! ViewController
            destino.theRecipe = sender as? Recipe
        }
    }
    
    @objc func connectionStatusChanged() {
        updateRecipes()
    }
        
    private func updateRecipes() {
        if InternetMonitor.shared.isConnected {
            recipes = DataManager.shared.getAllDrinks()
            tableView.reloadData()
        } else {
            showAlert(message: "No hay conexión a Internet. Por favor, verifica tu conexión.")
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("ConnectionStatusChanged"), object: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
