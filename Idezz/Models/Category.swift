//
//  Citation.swift
//  Idezz
//
//  Created by Kalló Barbara on 2019. 06. 19..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//

import UIKit

struct Category: Decodable {
    
    let title: String
    let items: [Quote]
    let textColor: String
    let backgroundColors: [String]
    let quotationMarkColor: String
}
