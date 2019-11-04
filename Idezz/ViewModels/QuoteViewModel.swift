//
//  Idezz
//
//  Created by Kalló Barbara on 2019. 10. 20..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//

import Foundation

class QuoteViewModel {
    
    private var currentIndex = 0
    private var shuffledQuotes: [Quote]!
    private var lastRandomQuote: Quote?
    
    var randomQuote: Quote? {
        if currentIndex >= category.items.count {
            currentIndex = 0
        }
        if currentIndex == 0 {
            repeat {
                shuffledQuotes = category.items.shuffled()
            } while shuffledQuotes.first == lastRandomQuote
        }
        lastRandomQuote = shuffledQuotes[currentIndex]
        currentIndex += 1
        return lastRandomQuote
    }
    var backgroundColors: [String] {
        return category.backgroundColors
    }
    var quotationMarkColor: String {
        return category.quotationMarkColor
    }
    var textColor: String {
        return category.textColor
    }
    var title: String {
        return category.title
    }
    private let category: Category
    
    init(category: Category) {
        self.category = category
    }
}
