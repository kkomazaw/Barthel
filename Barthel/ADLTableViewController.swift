//
//  ADLTableViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/08/11.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit
import CoreData

class ADLTableViewController: UITableViewController, UISearchResultsUpdating{
    
    var savedArray:[ADLData] = []
    var unfilteredNFLTeams:Array<String> = []
    var filteredNFLTeams:Array<String> = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "検索"
        tableView.tableHeaderView = searchController.searchBar
        super.viewDidLoad()
        myCalc()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func myCalc(){
        unfilteredNFLTeams.removeAll()
        let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            
            let sortDescripter = NSSortDescriptor(key: "date", ascending: false)
            let fetchRequest: NSFetchRequest<ADLData> = ADLData.fetchRequest()
            fetchRequest.sortDescriptors = [sortDescripter]
            savedArray = try myContext.fetch(fetchRequest)
        }
        catch {
            print("Fetching Failed.")
        }
        if savedArray.count == 0{
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d "
        let i = savedArray.count-1
        for j in 0...i{
            let myDate = dateFormatter.string(from: savedArray[j].date! as Date)
            if savedArray[j].memo?.isEmpty == true{
                savedArray[j].memo = nil
            }
            if savedArray[j].memo != nil {
                let m = myDate + " " + savedArray[j].memo!
                unfilteredNFLTeams.append(m + " " + savedArray[j].adlIndex!)
            }
            else{
                unfilteredNFLTeams.append(myDate + savedArray[j].adlIndex!)
            }
        }
        filteredNFLTeams = unfilteredNFLTeams
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myCalc2(){
        unfilteredNFLTeams.removeAll()
        let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            
            let sortDescripter = NSSortDescriptor(key: "date", ascending: false)
            let fetchRequest: NSFetchRequest<ADLData> = ADLData.fetchRequest()
            fetchRequest.sortDescriptors = [sortDescripter]
            savedArray = try myContext.fetch(fetchRequest)
        }
        catch {
            print("Fetching Failed.")
        }
        if savedArray.count == 0{
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d "
        let i = savedArray.count-1
        for j in 0...i{
            let myDate = dateFormatter.string(from: savedArray[j].date! as Date)
            if savedArray[j].memo?.isEmpty == true{
                savedArray[j].memo = nil
            }
            if savedArray[j].memo != nil {
                let m = myDate + " " + savedArray[j].memo!
                unfilteredNFLTeams.append(m + " " + savedArray[j].adlIndex!)
            }
            else{
                unfilteredNFLTeams.append(myDate + savedArray[j].adlIndex!)
            }
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNFLTeams.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseADL", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel!.text = filteredNFLTeams[indexPath.row]
        
        cell.textLabel?.minimumScaleFactor = 0.5
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredNFLTeams = unfilteredNFLTeams.filter { team in
                return team.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredNFLTeams = unfilteredNFLTeams
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        revisionIsActive = false
        revisionCompleted = false
        let indexOfSelectedRow = unfilteredNFLTeams.firstIndex(of: filteredNFLTeams[indexPath.row])
        if savedArray[indexOfSelectedRow!].detail != nil{
            detailHeader = filteredNFLTeams[indexPath.row]
            detailString = savedArray[indexOfSelectedRow!].detail!
            if savedArray[indexOfSelectedRow!].memo != nil{
                detailMemo = savedArray[indexOfSelectedRow!].memo!
            }
            else{
                detailMemo = ""
            }
            detailDate = savedArray[indexOfSelectedRow!].date! as NSDate
        }else{
            detailHeader = filteredNFLTeams[indexPath.row]
            detailString = ""
        }
        self.performSegue(withIdentifier: "toADLDetail", sender: true)
        
    }//override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let indexOfSelectedRow = unfilteredNFLTeams.firstIndex(of: filteredNFLTeams[indexPath.row])
            myContext.delete(savedArray[indexOfSelectedRow!])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            unfilteredNFLTeams.remove(at: indexOfSelectedRow!)
            filteredNFLTeams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            myCalc2()
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
}
