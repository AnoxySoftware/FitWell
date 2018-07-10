//
//  DetailsVC.swift
//  FitWell
//
//  Created by Lefteris Haritou on 10/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//


import UIKit

class DetailsVC : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var detailsVM = DetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DetailHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !detailsVM.hasData() {
            self.fetchData()
        }
    }
    
    func fetchData() {
        NetworkManager.shared.fetchProfile {[weak self] (data) in
            if let data = data {
                self?.parseData(data: data)
            }
        }
    }
    
    func parseData(data : Data) {
        let decoder = JSONDecoder()
        do {
            let userData = try decoder.decode(UserData.self, from: data)
            self.detailsVM.setUserData(userData: userData)
            self.tableView.reloadData()
        }
        catch {
            print("Error parsing Json")
        }
    }
}

extension DetailsVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailsVM.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        if let routeModel = self.detailsVM.dataForIndexPath(indexPath: indexPath) {
            cell.configure(withVM: routeModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeader") as! DetailHeaderView
        if let headerData = self.detailsVM.dataForHeaderInSection(section: section) {
            header.configure(withVM: headerData)
        }
        return header
    }
}
