//
//  Manager.swift
//  exsampleTableView
//
//  Created by Дмитрий Богданович on 26.01.23.
//

import UIKit

final class Articles {
    let autor: String
    let image: UIImage
    let text: String
    let label: String
    let publishedAt: String
    

    init(autor: String , image: UIImage , text: String , label: String , publishedAt: String) {
        self.autor = autor
        self.image = image
        self.text = text
        self.label = label
        self.publishedAt = publishedAt
    }
}
