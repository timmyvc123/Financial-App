//
//  DateSelectionTableViewController.swift
//  FinancialApp
//
//  Created by Timmy Van Cauwenberge on 7/28/21.
//

import UIKit

class DateSelectionTableViewController: UITableViewController {
    
    var timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted?
    var monthInfos: [MonthInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonthInfoViews()
    }
    
    private func setupMonthInfoViews() {
        if let monthInfos = timeSeriesMonthlyAdjusted?.getMonthInfos() {
            self.monthInfos = monthInfos
        }
    }
    
    
    
}

extension DateSelectionTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthInfos.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! DateSelectionTableViewCell
        let monthInfo = monthInfos[indexPath.row]
        cell.configure(with: monthInfo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class DateSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthsAgoLabel: UILabel!
    
    func configure(with monthInfo: MonthInfo) {
        backgroundColor = .red
    }
}
