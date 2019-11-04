//
//  Idezz
//
//  Created by Kalló Barbara on 2019. 10. 20..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//

import Foundation

class ListViewModel {
    
    lazy var categories: [Category] = {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let dictionary = try? JSONDecoder().decode([String: [Category]].self, from: data),
            let categories = dictionary["categories"] else {
                fatalError("Could not parse categories.")
        }
        let allItems = categories.flatMap {
            return $0.items
        }
        let allItemsCategory = Category(title: "Napi idézet",
                                        items: allItems,
                                        textColor: "#000000",
                                        backgroundColors: ["#e4b0b0", "#bd3b3b"],
                                        quotationMarkColor: "#712323")
        
        
        return categories + [allItemsCategory]
    }()
    
    func quoteViewModel(for index: Int) -> QuoteViewModel {
        return QuoteViewModel(category: categories[index])
    }
}
