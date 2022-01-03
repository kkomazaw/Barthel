//
//  BarthelViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/06/19.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit
import CoreData

class BarthelViewController: UIViewController {
    
    @IBOutlet var Shokuji: UISegmentedControl!
    @IBOutlet var Toire: UISegmentedControl!
    @IBOutlet var Kaidan: UISegmentedControl!
    @IBOutlet var Koui: UISegmentedControl!
    @IBOutlet var Haiben: UISegmentedControl!
    @IBOutlet var Hainyo: UISegmentedControl!
    @IBOutlet var Seiyo: UISegmentedControl!
    @IBOutlet var Nyuyoku: UISegmentedControl!
    @IBOutlet var Ijou: UISegmentedControl!
    @IBOutlet var Heichi: UISegmentedControl!
    @IBOutlet var BarthelPoint: UILabel!
    @IBOutlet var HaiyoState: UILabel!
    @IBOutlet var ClearButton:UIButton!
    @IBOutlet var myButton:UIButton!
    @IBOutlet var Hozonzumi:UIBarButtonItem!
    
    
    var detailArray:Array<String> = ["10","10","10","10","10","10","5","5","15","15","100"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func myCalc(){
        let vShokuji = (2-Shokuji.selectedSegmentIndex) * 5
        detailArray[0] = String(vShokuji)
        let vToire = (2-Toire.selectedSegmentIndex) * 5
        detailArray[1] = String(vToire)
        let vKaidan = (2-Kaidan.selectedSegmentIndex) * 5
        detailArray[2] = String(vKaidan)
        let vKoui = (2-Koui.selectedSegmentIndex) * 5
        detailArray[3] = String(vKoui)
        let vHaiben = (2-Haiben.selectedSegmentIndex) * 5
        detailArray[4] = String(vHaiben)
        let vHainyo = (2-Hainyo.selectedSegmentIndex) * 5
        detailArray[5] = String(vHainyo)
        let vSeiyo = (1-Seiyo.selectedSegmentIndex) * 5
        detailArray[6] = String(vSeiyo)
        let vNyuyoku = (1-Nyuyoku.selectedSegmentIndex) * 5
        detailArray[7] = String(vNyuyoku)
        let vIjou = (3-Ijou.selectedSegmentIndex) * 5
        detailArray[8] = String(vIjou)
        let vHeichi = (3-Heichi.selectedSegmentIndex) * 5
        detailArray[9] = String(vHeichi)
        let vBarthelPoint = vShokuji + vToire + vKaidan + vKoui + vHaiben + vHainyo + vSeiyo + vNyuyoku + vIjou + vHeichi
        detailArray[10] = String(vBarthelPoint)
        if vBarthelPoint <= 85{
            HaiyoState.text = "廃用症候群"
        }
        else{
            HaiyoState.text = ""
        }
        BarthelPoint.text = "\(vBarthelPoint)"
    }
    
    @IBAction func myActionRUN(){
    myCalc()
        }
    
    @IBAction func myActionButton(){
        myCalc()
        var detailValueString = ""
        for i in detailArray{
            detailValueString = detailValueString + i + "\n"
        }
        var titleString = "注釈入力"
        var messageString = "注釈（メモ、名前等）が入力できます\n（日付は自動的に入力されます）"
        if revisionIsActive == true{
            titleString = "注釈修正"
            messageString = "注釈（メモ、名前等）が修正できます"
        }
         let alert: UIAlertController = UIAlertController(title:titleString,
         message: messageString,
         preferredStyle: UIAlertController.Style.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "入力完了",
         style: UIAlertAction.Style.default,
         handler:{
         (action:UIAlertAction!) -> Void in
         let textField = alert.textFields![0]
            let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            if revisionIsActive == true{
                do{
                //修正モードの時は、detailDateが一致するデータをfetchRequestで検索し、
                //それぞれを新規データで置き換える。
                let fetchRequest: NSFetchRequest<BarthelData> = BarthelData.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "date = %@",detailDate)
                let fetchResult = try myContext.fetch(fetchRequest)
                    fetchResult[0].barthelIndex = "BI " + self.BarthelPoint.text!
                    fetchResult[0].detail = detailValueString
                    detailString = detailValueString
                    fetchResult[0].memo = textField.text
                    detailMemo = textField.text!
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy.M.d "
                    let dateString = dateFormatter.string(from: detailDate as Date)
                    if let i = fetchResult[0].memo{
                        detailHeader = dateString + " " + i + " BI " + self.BarthelPoint.text!
                    }else{
                        detailHeader = dateString + " BI " + self.BarthelPoint.text!
                    }
                }
                catch {
                    print("Fetching Failed.")
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.navigationItem.title = "新規入力"
                self.performSegue(withIdentifier: "fromBarthelToDetail", sender: true)
            }//if self.revisionIsActive == true
            else{
                let barthelData:BarthelData = BarthelData(context: myContext)
                barthelData.barthelIndex = "BI " + self.BarthelPoint.text!
                barthelData.detail = detailValueString
                barthelData.date = NSDate() as Date
                barthelData.memo = textField.text
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.performSegue(withIdentifier: "toBarthelSavedTable", sender: true)
            }//else
            
         })//let okAction: UIAlertAction = UIAlertAction(
         let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",
         style: UIAlertAction.Style.cancel,
         handler:{
         (action:UIAlertAction!) -> Void in
         })//let cancelAction: UIAlertAction = UIAlertAction(
         
         alert.addAction(okAction)
         alert.addAction(cancelAction)
         // UIAlertControllerにtextFieldを追加
         alert.addTextField { (textField:UITextField!) -> Void in
            if revisionIsActive == true{
                textField.text = detailMemo
            }
         }
         self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func myActionClear(){
        Shokuji.selectedSegmentIndex = 0
        Toire.selectedSegmentIndex = 0
        Kaidan.selectedSegmentIndex = 0
        Koui.selectedSegmentIndex = 0
        Haiben.selectedSegmentIndex = 0
        Hainyo.selectedSegmentIndex = 0
        Seiyo.selectedSegmentIndex = 0
        Nyuyoku.selectedSegmentIndex = 0
        Ijou.selectedSegmentIndex = 0
        Heichi.selectedSegmentIndex = 0
        BarthelPoint.text = "100"
        HaiyoState.text = ""
    }
    
    @IBAction func fromBarthelDetailToBarthelView(_ Segue:UIStoryboardSegue){
        revisionIsActive = true
        revisionCompleted = false
        if detailString.isEmpty == true{
            return
        }
        let arr:[String] = detailString.components(separatedBy: "\n")
        Shokuji.selectedSegmentIndex = 2 - Int(arr[0])! / 5
        Toire.selectedSegmentIndex = 2 - Int(arr[1])! / 5
        Kaidan.selectedSegmentIndex = 2 - Int(arr[2])! / 5
        Koui.selectedSegmentIndex = 2 - Int(arr[3])! / 5
        Haiben.selectedSegmentIndex = 2 - Int(arr[4])! / 5
        Hainyo.selectedSegmentIndex = 2 - Int(arr[5])! / 5
        Seiyo.selectedSegmentIndex = 1 - Int(arr[6])! / 5
        Nyuyoku.selectedSegmentIndex = 1 - Int(arr[7])! / 5
        Ijou.selectedSegmentIndex = 3 - Int(arr[8])! / 5
        Heichi.selectedSegmentIndex = 3 - Int(arr[9])! / 5
        myCalc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if revisionCompleted == true{
            Shokuji.selectedSegmentIndex = 0
            Toire.selectedSegmentIndex = 0
            Kaidan.selectedSegmentIndex = 0
            Koui.selectedSegmentIndex = 0
            Haiben.selectedSegmentIndex = 0
            Hainyo.selectedSegmentIndex = 0
            Seiyo.selectedSegmentIndex = 0
            Nyuyoku.selectedSegmentIndex = 0
            Ijou.selectedSegmentIndex = 0
            Heichi.selectedSegmentIndex = 0
            BarthelPoint.text = "100"
            HaiyoState.text = ""
            revisionCompleted = false
        }//if revisionCompleted == true
        if revisionIsActive == true{
            self.view.backgroundColor = #colorLiteral(red: 0.994544011, green: 1, blue: 0.9633514644, alpha: 1)
            self.navigationItem.title = detailMemo + " 修正"
            self.navigationItem.hidesBackButton = true
            Hozonzumi.isEnabled = false
            Hozonzumi.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        else{
            self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.navigationItem.title = "Barthel Index"
            self.navigationItem.hidesBackButton = false
            Hozonzumi.isEnabled = true
            Hozonzumi.tintColor = #colorLiteral(red: 0.1082625017, green: 0.4759343863, blue: 0.9810132384, alpha: 1)
        }
    }//override func viewWillAppear(_ animated: Bool)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
