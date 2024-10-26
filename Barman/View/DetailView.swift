//
//  DetailView.swift
//  Barman
//
//  Created by OYuuyuMP on 25/10/24.
//

import UIKit

class DetailView: UIView{
    let tv = UITextView()
    let iv = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextView() {
        tv.frame = CGRect(x: 0, y: 310, width: self.frame.width, height: self.frame.height - 310)
        tv.backgroundColor = UIColor(red: 0.6, green: 1.0, blue: 0.8, alpha: 1.0) // Mint Green
        tv.isEditable = false
        tv.font = UIFont(name: "MarkerFelt-Thin", size: 22)
        self.addSubview(tv)
    }
    
    private func setupImageView() {
        iv.contentMode = .scaleAspectFit
        iv.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 300) // Imagen en la parte superior
        self.addSubview(iv)
    }
    
    func updateText(_ info: String) {
        tv.text = info
    }
    
    func loadImage(from imageUrl: String) {
        guard let url = URL(string: "http://janzelaznog.com/DDAM/iOS/drinksimages/\(imageUrl)") else {
            print("Invalid url for the image")
            return
        }
            
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                print("Error al cargar la imagen: \(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("No se pudo cargar la imagen")
                return
            }
            DispatchQueue.main.async {
                self?.iv.image = image
            }
        }.resume()
    }
}
