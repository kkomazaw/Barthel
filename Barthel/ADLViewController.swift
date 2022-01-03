//
//  ADLViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/06/19.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit
import CoreData

class ADLViewController: UIViewController {
    
    @IBOutlet var ShojoAnsei:UISegmentedControl!
    @IBOutlet var Dochirakanote:UISegmentedControl!
    @IBOutlet var Negaeri:UISegmentedControl!
    @IBOutlet var Okiagari:UISegmentedControl!
    @IBOutlet var Zaihoji:UISegmentedControl!
    @IBOutlet var Ijou:UISegmentedControl!
    @IBOutlet var Idohoho:UISegmentedControl!
    @IBOutlet var Kokuseiketsu:UISegmentedControl!
    @IBOutlet var Shokujisesshu:UISegmentedControl!
    @IBOutlet var IfukunoChakudatsu:UISegmentedControl!
    @IBOutlet var TashahenoIshi:UISegmentedControl!
    @IBOutlet var ShinryojonoShiji:UISegmentedControl!
    @IBOutlet var Kikenkodo:UISegmentedControl!
    @IBOutlet var Score:UILabel!
    @IBOutlet var ClearButton:UIButton!
    @IBOutlet var myButton:UIButton!
    @IBOutlet var Hozonzumi:UIBarButtonItem!
    
    var detailArray:Array<String> = ["0","0","0","0","0","0","0",
                                    "0","0","0","0","0","0","0"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func myCalc(){
        let vShojoAnsei = ShojoAnsei.selectedSegmentIndex
        detailArray[0] = String(vShojoAnsei)
        let vDochirakanote = Dochirakanote.selectedSegmentIndex
        detailArray[1] = String(vDochirakanote)
        let vNegaeri = Negaeri.selectedSegmentIndex
        detailArray[2] = String(vNegaeri)
        let vOkiagari = Okiagari.selectedSegmentIndex
        detailArray[3] = String(vOkiagari)
        let vZaihoji = Zaihoji.selectedSegmentIndex
        detailArray[4] = String(vZaihoji)
        let vIjou = Ijou.selectedSegmentIndex
        detailArray[5] = String(vIjou)
        let vIdohoho = Idohoho.selectedSegmentIndex
        detailArray[6] = String(vIdohoho)
        let vKokuseiketsu = Kokuseiketsu.selectedSegmentIndex
        detailArray[7] = String(vKokuseiketsu)
        let vShokujisesshu = Shokujisesshu.selectedSegmentIndex
        detailArray[8] = String(vShokujisesshu)
        let vIfukunoChakudatsu = IfukunoChakudatsu.selectedSegmentIndex
        detailArray[9] = String(vIfukunoChakudatsu)
        let vTashahenoIshi = TashahenoIshi.selectedSegmentIndex
        detailArray[10] = String(vTashahenoIshi)
        let vShinryojonoShiji = ShinryojonoShiji.selectedSegmentIndex
        detailArray[11] = String(vShinryojonoShiji)
        let vKikenkodo = Kikenkodo.selectedSegmentIndex
        detailArray[12] = String(vKikenkodo)
        let vScore = vShojoAnsei + vDochirakanote + vNegaeri + vOkiagari + vZaihoji + vIjou + vIdohoho + vKokuseiketsu + vShokujisesshu + vIfukunoChakudatsu + vTashahenoIshi + vShinryojonoShiji + vKikenkodo
        detailArray[13] = String(vScore)
        Score.text = String(vScore)
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
                                                                let fetchRequest: NSFetchRequest<ADLData> = ADLData.fetchRequest()
                                                                fetchRequest.predicate = NSPredicate(format: "date = %@",detailDate)
                                                                let fetchResult = try myContext.fetch(fetchRequest)
                                                                fetchResult[0].adlIndex = "NSKH " + self.Score.text!
                                                                fetchResult[0].detail = detailValueString
                                                                detailString = detailValueString
                                                                fetchResult[0].memo = textField.text
                                                                detailMemo = textField.text!
                                                                let dateFormatter = DateFormatter()
                                                                dateFormatter.dateFormat = "yyyy.M.d "
                                                                let dateString = dateFormatter.string(from: detailDate as Date)
                                                                if let i = fetchResult[0].memo{
                                                                    detailHeader = dateString + " " + i + " NSKH " + self.Score.text!
                                                                }else{
                                                                    detailHeader = dateString + " NSKH " + self.Score.text!
                                                                }
                                                            }
                                                            catch {
                                                                print("Fetching Failed.")
                                                            }
                                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                                            self.navigationItem.title = "新規入力"
                                                            self.performSegue(withIdentifier: "fromADLToDetail", sender: true)
                                                        }//if self.revisionIsActive == true
                                                        else{
                                                            let adlData:ADLData = ADLData(context: myContext)
                                                            adlData.adlIndex = "NSKH " + self.Score.text!
                                                            adlData.detail = detailValueString
                                                            adlData.date = NSDate() as Date
                                                            adlData.memo = textField.text
                                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                                            self.performSegue(withIdentifier: "toADLSavedTable", sender: true)
                                                        }//else
                                                        
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",
                                                        style: UIAlertAction.Style.cancel,
                                                        handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            //   adlData.memo = ""
                                                            //   self.performSegue(withIdentifier: "toADLSavedTable", sender: true)
        })
        
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
        ShojoAnsei.selectedSegmentIndex = 0
        Dochirakanote.selectedSegmentIndex = 0
        Negaeri.selectedSegmentIndex = 0
        Okiagari.selectedSegmentIndex = 0
        Zaihoji.selectedSegmentIndex = 0
        Ijou.selectedSegmentIndex = 0
        Idohoho.selectedSegmentIndex = 0
        Kokuseiketsu.selectedSegmentIndex = 0
        Shokujisesshu.selectedSegmentIndex = 0
        IfukunoChakudatsu.selectedSegmentIndex = 0
        TashahenoIshi.selectedSegmentIndex = 0
        ShinryojonoShiji.selectedSegmentIndex = 0
        Kikenkodo.selectedSegmentIndex = 0
        Score.text = "0"
    }
    
    @IBAction func fromADLDetailToADLView(_ Segue:UIStoryboardSegue){
        revisionIsActive = true
        revisionCompleted = false
        if detailString.isEmpty == true{
            return
        }
        let arr:[String] = detailString.components(separatedBy: "\n")
        ShojoAnsei.selectedSegmentIndex = Int(arr[0])!
        Dochirakanote.selectedSegmentIndex = Int(arr[1])!
        Negaeri.selectedSegmentIndex = Int(arr[2])!
        Okiagari.selectedSegmentIndex = Int(arr[3])!
        Zaihoji.selectedSegmentIndex = Int(arr[4])!
        Ijou.selectedSegmentIndex = Int(arr[5])!
        Idohoho.selectedSegmentIndex = Int(arr[6])!
        Kokuseiketsu.selectedSegmentIndex = Int(arr[7])!
        Shokujisesshu.selectedSegmentIndex = Int(arr[8])!
        IfukunoChakudatsu.selectedSegmentIndex = Int(arr[9])!
        TashahenoIshi.selectedSegmentIndex = Int(arr[10])!
        ShinryojonoShiji.selectedSegmentIndex = Int(arr[11])!
        Kikenkodo.selectedSegmentIndex = Int(arr[12])!
        myCalc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if revisionCompleted == true{
            ShojoAnsei.selectedSegmentIndex = 0
            Dochirakanote.selectedSegmentIndex = 0
            Negaeri.selectedSegmentIndex = 0
            Okiagari.selectedSegmentIndex = 0
            Zaihoji.selectedSegmentIndex = 0
            Ijou.selectedSegmentIndex = 0
            Idohoho.selectedSegmentIndex = 0
            Kokuseiketsu.selectedSegmentIndex = 0
            Shokujisesshu.selectedSegmentIndex = 0
            IfukunoChakudatsu.selectedSegmentIndex = 0
            TashahenoIshi.selectedSegmentIndex = 0
            ShinryojonoShiji.selectedSegmentIndex = 0
            Kikenkodo.selectedSegmentIndex = 0
            Score.text = "0"
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
            self.navigationItem.title = "日常生活機能評価表"
            self.navigationItem.hidesBackButton = false
            Hozonzumi.isEnabled = true
            Hozonzumi.tintColor = #colorLiteral(red: 0.1082625017, green: 0.4759343863, blue: 0.9810132384, alpha: 1)
        }
    }//override func viewWillAppear(_ animated: Bool)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
