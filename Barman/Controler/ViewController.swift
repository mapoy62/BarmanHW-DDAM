//
//  ViewController.swift
//  Barman
//
//  Created by OYuuyuMP on 24/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var theRecipe: Recipe!
    var detail: DetailView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detail = DetailView(frame: view.bounds.insetBy(dx: 20, dy: 20))
        view.addSubview(detail)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let info = """
            \(theRecipe.name ?? "")
            Ingredients: \(theRecipe.ingredients ?? "")
            Instructions: \(theRecipe.directions ?? "")
            """
        // Actualiza el texto en la vista de detalles
        detail.updateText(info)
        
        // Carga la imagen correspondiente
        if let imageUrl = theRecipe.image {
            detail.loadImage(from: imageUrl)
        }
        
    }
}

