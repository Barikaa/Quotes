//
//  Idezz
//
//  Created by Kalló Barbara on 2019. 06. 19..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//


import UIKit

class ListViewController: UITableViewController {
    
    var viewModel: ListViewModel = ListViewModel()
    
    private let cellMinHeight: CGFloat = 100.0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "IdezzCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else {
            fatalError("Could not dequeue cell with identifier \(cellId)")
        }
        
        let category = viewModel.categories[indexPath.row]
        cell.textLabel?.text = category.title
    
        guard let backgroundColor = category.backgroundColors.last else {fatalError()}
        
        let categoryColor = UIColor(hexString: backgroundColor)
        cell.backgroundColor = categoryColor
        cell.textLabel?.textColor = UIColor(hexString: category.textColor)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableHeight = tableView.bounds.height
        let cellHeight = tableHeight/CGFloat(viewModel.categories.count)
        
        return max(cellHeight, cellMinHeight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let secondVC = segue.destination as? QuoteViewController else {
            return
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Kategóriák"
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.barTintColor = cell.backgroundColor
        secondVC.viewModel = viewModel.quoteViewModel(for: indexPath.row)
    }
}

