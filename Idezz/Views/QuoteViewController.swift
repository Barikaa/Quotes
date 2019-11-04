//
//  Idezz
//
//  Created by Kalló Barbara on 2019. 06. 19..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    var viewModel: QuoteViewModel!
    
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var upperQuotationMark: UILabel!
    @IBOutlet var lowerQuotationMark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let quote = viewModel.randomQuote
        setQuote(quote)
      
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = viewModel.backgroundColors.map {
            return UIColor(hexString: $0).cgColor
        }
        gradientLayer.frame = view.layer.bounds
        gradientLayer.locations = [0, 1]
        view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
    
        let quotationMarkColor = UIColor(hexString: viewModel.quotationMarkColor)
        textLabel.textColor = UIColor(hexString: viewModel.textColor)
        authorLabel.textColor = UIColor(hexString: viewModel.textColor)
        upperQuotationMark.textColor = quotationMarkColor
        lowerQuotationMark.textColor = quotationMarkColor
        
        self.title = viewModel.title
    }
    
    @IBAction func loadNext(_ sender: Any) {
        let quote = viewModel.randomQuote
        setQuote(quote)
    }
    
    private func setQuote(_ quote: Quote?) {
        textLabel.text = quote?.text
        authorLabel.text = quote?.author
    }
}
