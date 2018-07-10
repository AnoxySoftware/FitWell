//
//  RacesVC.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class RacesVC : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let raceVM = RacesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !raceVM.hasData() {
            self.fetchData()
        }
    }
    
    func fetchData() {
        NetworkManager.shared.fetchRaces {[weak self] (data) in
            if let data = data {
                self?.parseData(data: data)
            }
        }
    }
    
    func parseData(data : Data) {
        let decoder = JSONDecoder()
        do {
            let racesArray = try decoder.decode([RacesModel].self, from: data)
            self.raceVM.setRaces(racesArray: racesArray)
            self.tableView.reloadData()
        }
        catch {
            print("Error parsing Json")
        }
    }
    
}

extension RacesVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.raceVM.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceCell", for: indexPath) as! RacesCell
        let raceModel = self.raceVM.dataForIndexPath(indexPath: indexPath)
        cell.configure(withVM: raceModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let raceModel = self.raceVM.dataForIndexPath(indexPath: indexPath)
        if !raceModel.detailsHidden {
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC")
            self.navigationController?.pushViewController(detailsVC!, animated: true)
        }
    }
}
