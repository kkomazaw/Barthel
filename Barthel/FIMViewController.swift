//
//  FIMViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/06/19.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit
import CoreData

class FIMViewController: UIViewController {
    
    @IBOutlet var Avalue: UILabel!
    @IBOutlet var Bvalue: UILabel!
    @IBOutlet var Cvalue: UILabel!
    @IBOutlet var Dvalue: UILabel!
    @IBOutlet var Evalue: UILabel!
    @IBOutlet var Fvalue: UILabel!
    @IBOutlet var Gvalue: UILabel!
    @IBOutlet var Hvalue: UILabel!
    @IBOutlet var Ivalue: UILabel!
    @IBOutlet var Jvalue: UILabel!
    @IBOutlet var Kvalue: UILabel!
    @IBOutlet var Lvalue: UILabel!
    @IBOutlet var Mvalue: UILabel!
    @IBOutlet var Nvalue: UILabel!
    @IBOutlet var Ovalue: UILabel!
    @IBOutlet var Pvalue: UILabel!
    @IBOutlet var Qvalue: UILabel!
    @IBOutlet var Rvalue: UILabel!
    @IBOutlet var UndoAtoM: UILabel!
    @IBOutlet var NinchiNtoR: UILabel!
    @IBOutlet var UndoValue: UILabel!
    @IBOutlet var NinchiValue: UILabel!
    @IBOutlet var SogoValue: UILabel!
    @IBOutlet var KaigoValue: UILabel!
    @IBOutlet var UndoKomoku: UILabel!
    @IBOutlet var NinchiKomoku: UILabel!
    @IBOutlet var SogoKomoku: UILabel!
    @IBOutlet var KaigoKomoku: UILabel!
    
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var myValue1: UIButton!
    @IBOutlet var myValue2: UIButton!
    @IBOutlet var myValue3: UIButton!
    @IBOutlet var myValue4: UIButton!
    @IBOutlet var myValue5: UIButton!
    @IBOutlet var myValue6: UIButton!
    @IBOutlet var myValue7: UIButton!
    @IBOutlet var aButton: UIButton!
    @IBOutlet var bButton: UIButton!
    @IBOutlet var cButton: UIButton!
    @IBOutlet var dButton: UIButton!
    @IBOutlet var eButton: UIButton!
    @IBOutlet var fButton: UIButton!
    @IBOutlet var gButton: UIButton!
    @IBOutlet var hButton: UIButton!
    @IBOutlet var iButton: UIButton!
    @IBOutlet var jButton: UIButton!
    @IBOutlet var kButton: UIButton!
    @IBOutlet var lButton: UIButton!
    @IBOutlet var mButton: UIButton!
    @IBOutlet var nButton: UIButton!
    @IBOutlet var oButton: UIButton!
    @IBOutlet var pButton: UIButton!
    @IBOutlet var qButton: UIButton!
    @IBOutlet var rButton: UIButton!
    @IBOutlet var myButton: UIButton!
    @IBOutlet var Hozonzumi:UIBarButtonItem!
    
    var vFlag = 0
    
    var detailArray:Array<String> = ["0","0","0","0","0","0","0","0","0","0","0",
                                     "0","0","0","0","0","0","0","0","0","0","0"]
    
    func hideAllButtons(){
        aButton.isHidden = true
        bButton.isHidden = true
        cButton.isHidden = true
        dButton.isHidden = true
        eButton.isHidden = true
        fButton.isHidden = true
        gButton.isHidden = true
        hButton.isHidden = true
        iButton.isHidden = true
        jButton.isHidden = true
        kButton.isHidden = true
        lButton.isHidden = true
        mButton.isHidden = true
        nButton.isHidden = true
        oButton.isHidden = true
        pButton.isHidden = true
        qButton.isHidden = true
        rButton.isHidden = true
        clearButton.isHidden = true
        myButton.isHidden = true
    }
    
    func hideAllLabels(){
        Avalue.isHidden = true
        Bvalue.isHidden = true
        Cvalue.isHidden = true
        Dvalue.isHidden = true
        Evalue.isHidden = true
        Fvalue.isHidden = true
        Gvalue.isHidden = true
        Hvalue.isHidden = true
        Ivalue.isHidden = true
        Jvalue.isHidden = true
        Kvalue.isHidden = true
        Lvalue.isHidden = true
        Mvalue.isHidden = true
        Nvalue.isHidden = true
        Ovalue.isHidden = true
        Pvalue.isHidden = true
        Qvalue.isHidden = true
        Rvalue.isHidden = true
    }
    
    func showAllLabels(){
        Avalue.isHidden = false
        Bvalue.isHidden = false
        Cvalue.isHidden = false
        Dvalue.isHidden = false
        Evalue.isHidden = false
        Fvalue.isHidden = false
        Gvalue.isHidden = false
        Hvalue.isHidden = false
        Ivalue.isHidden = false
        Jvalue.isHidden = false
        Kvalue.isHidden = false
        Lvalue.isHidden = false
        Mvalue.isHidden = false
        Nvalue.isHidden = false
        Ovalue.isHidden = false
        Pvalue.isHidden = false
        Qvalue.isHidden = false
        Rvalue.isHidden = false
    }
    
    func showAllButtons(){
        aButton.isHidden = false
        bButton.isHidden = false
        cButton.isHidden = false
        dButton.isHidden = false
        eButton.isHidden = false
        fButton.isHidden = false
        gButton.isHidden = false
        hButton.isHidden = false
        iButton.isHidden = false
        jButton.isHidden = false
        kButton.isHidden = false
        lButton.isHidden = false
        mButton.isHidden = false
        nButton.isHidden = false
        oButton.isHidden = false
        pButton.isHidden = false
        qButton.isHidden = false
        rButton.isHidden = false
        clearButton.isHidden = false
        myButton.isHidden = false
        myValue1.isHidden = true
        myValue2.isHidden = true
        myValue3.isHidden = true
        myValue4.isHidden = true
        myValue5.isHidden = true
        myValue6.isHidden = true
        myValue7.isHidden = true
    }
    
    func hideNumberButtons(){
        myValue1.isHidden = true
        myValue2.isHidden = true
        myValue3.isHidden = true
        myValue4.isHidden = true
        myValue5.isHidden = true
        myValue6.isHidden = true
        myValue7.isHidden = true
    }
    
    func showNumberButtons(){
        myValue1.isHidden = false
        myValue2.isHidden = false
        myValue3.isHidden = false
        myValue4.isHidden = false
        myValue5.isHidden = false
        myValue6.isHidden = false
        myValue7.isHidden = false
    }
    
    func hideAllKomoku(){
        UndoAtoM.isHidden = true
        NinchiNtoR.isHidden = true
        UndoKomoku.isHidden = true
        NinchiKomoku.isHidden = true
        SogoKomoku.isHidden = true
        KaigoKomoku.isHidden = true
        UndoValue.isHidden = true
        NinchiValue.isHidden = true
        SogoValue.isHidden = true
        KaigoValue.isHidden = true
    }
    
    func showAllKomoku(){
        UndoAtoM.isHidden = false
        NinchiNtoR.isHidden = false
        UndoKomoku.isHidden = false
        NinchiKomoku.isHidden = false
        SogoKomoku.isHidden = false
        KaigoKomoku.isHidden = false
        UndoValue.isHidden = false
        NinchiValue.isHidden = false
        SogoValue.isHidden = false
        KaigoValue.isHidden = false
    }
    
    func clearAllLabels(){
        Avalue.text = ""
        Bvalue.text = ""
        Cvalue.text = ""
        Dvalue.text = ""
        Evalue.text = ""
        Fvalue.text = ""
        Gvalue.text = ""
        Hvalue.text = ""
        Ivalue.text = ""
        Jvalue.text = ""
        Kvalue.text = ""
        Lvalue.text = ""
        Mvalue.text = ""
        Nvalue.text = ""
        Ovalue.text = ""
        Pvalue.text = ""
        Qvalue.text = "" 
        Rvalue.text = ""  
        UndoValue.text = "" 
        NinchiValue.text = ""  
        SogoValue.text = "" 
        KaigoValue.text = ""  
    }
    
    func myCalc(){
        self.showAllKomoku()
        var vA = 0
        if let i = Int(Avalue.text!){
            vA = i
            detailArray[0] = String(i)
        }
        var vB = 0
        if let i = Int(Bvalue.text!){
            vB = i
            detailArray[1] = String(i)
        }
        var vC = 0
        if let i = Int(Cvalue.text!){
            vC = i
            detailArray[2] = String(i)
        }
        var vD = 0
        if let i = Int(Dvalue.text!){
            vD = i
            detailArray[3] = String(i)
        }
        var vE = 0
        if let i = Int(Evalue.text!){
            vE = i
            detailArray[4] = String(i)
        }
        var vF = 0
        if let i = Int(Fvalue.text!){
            vF = i
            detailArray[5] = String(i)
        }
        var vG = 0
        if let i = Int(Gvalue.text!){
            vG = i
            detailArray[6] = String(i)
        }
        var vH = 0
        if let i = Int(Hvalue.text!){
            vH = i
            detailArray[7] = String(i)
        }
        var vI = 0
        if let i = Int(Ivalue.text!){
            vI = i
            detailArray[8] = String(i)
        }
        var vJ = 0
        if let i = Int(Jvalue.text!){
            vJ = i
            detailArray[9] = String(i)
        }
        var vK = 0
        if let i = Int(Kvalue.text!){
            vK = i
            detailArray[10] = String(i)
        }
        var vL = 0
        if let i = Int(Lvalue.text!){
            vL = i
            detailArray[11] = String(i)
        }
        var vM = 0
        if let i = Int(Mvalue.text!){
            vM = i
            detailArray[12] = String(i)
        }
        var vN = 0
        if let i = Int(Nvalue.text!){
            vN = i
            detailArray[13] = String(i)
        }
        var vO = 0
        if let i = Int(Ovalue.text!){
            vO = i
            detailArray[14] = String(i)
        }
        var vP = 0
        if let i = Int(Pvalue.text!){
            vP = i
            detailArray[15] = String(i)
        }
        var vQ = 0
        if let i = Int(Qvalue.text!){
            vQ = i
            detailArray[16] = String(i)
        }
        var vR = 0
        if let i = Int(Rvalue.text!){
            vR = i
            detailArray[17] = String(i)
        }
        let vUndo = vA + vB + vC + vD + vE + vF + vG + vH + vI + vJ + vK + vL + vM
        detailArray[18] = String(vUndo)
        let vNinchi = vN + vO + vP + vQ + vR
        detailArray[19] = String(vNinchi)
        let vSogo = vUndo + vNinchi
        detailArray[20] = String(vSogo)
        var vKaigo = Int(round(-1.6*Double(vSogo)) + 176.0)
        if vKaigo < 0{
            vKaigo = 0
        }
        detailArray[21] = String(vKaigo)
        UndoValue.text = String(vUndo) + "点"
        NinchiValue.text = String(vNinchi) + "点"
        SogoValue.text = String(vSogo) + "点"
        KaigoValue.text = String(vKaigo) + "分"
    }
    
    @IBAction func myActionClear(){
        self.hideNumberButtons()
        self.showAllButtons()
        self.clearAllLabels()
        vFlag = 0
        for i in 0...detailArray.count-1{
            detailArray[i] = "0"
        }
    }
    
    @IBAction func myActionA(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        aButton.isHidden = false
        vFlag = 1
    }
    @IBAction func myActionB(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        bButton.isHidden = false
        vFlag = 2
    }
    @IBAction func myActionC(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        cButton.isHidden = false
        vFlag = 3
    }
    @IBAction func myActionD(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        dButton.isHidden = false
        vFlag = 4
    }
    @IBAction func myActionE(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        eButton.isHidden = false
        vFlag = 5
    }
    @IBAction func myActionF(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        fButton.isHidden = false
        vFlag = 6
    }
    @IBAction func myActionG(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        gButton.isHidden = false
        vFlag = 7
    }
    @IBAction func myActionH(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        hButton.isHidden = false
        vFlag = 8
    }
    @IBAction func myActionI(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        iButton.isHidden = false
        vFlag = 9
    }
    @IBAction func myActionJ(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        jButton.isHidden = false
        vFlag = 10
    }
    @IBAction func myActionK(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        kButton.isHidden = false
        vFlag = 11
    }
    @IBAction func myActionL(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        lButton.isHidden = false
        vFlag = 12
    }
    @IBAction func myActionM(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        mButton.isHidden = false
        vFlag = 13
    }
    @IBAction func myActionN(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        nButton.isHidden = false
        vFlag = 14
    }
    @IBAction func myActionO(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        oButton.isHidden = false
        vFlag = 15
    }
    @IBAction func myActionP(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        pButton.isHidden = false
        vFlag = 16
    }
    @IBAction func myActionQ(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        qButton.isHidden = false
        vFlag = 17
    }
    @IBAction func myActionR(){
        self.showNumberButtons()
        self.hideAllButtons()
        self.hideAllLabels()
        self.hideAllKomoku()
        rButton.isHidden = false
        vFlag = 18
    }
    @IBAction func myAction1(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "1"
        case 2:
            Bvalue.text = "1"
        case 3:
            Cvalue.text = "1"
        case 4:
            Dvalue.text = "1"
        case 5:
            Evalue.text = "1"
        case 6:
            Fvalue.text = "1"
        case 7:
            Gvalue.text = "1"
        case 8:
            Hvalue.text = "1"
        case 9:
            Ivalue.text = "1"
        case 10:
            Jvalue.text = "1"
        case 11:
            Kvalue.text = "1"
        case 12:
            Lvalue.text = "1"
        case 13:
            Mvalue.text = "1"
        case 14:
            Nvalue.text = "1"
        case 15:
            Ovalue.text = "1"
        case 16:
            Pvalue.text = "1"
        case 17:
            Qvalue.text = "1"
        case 18:
            Rvalue.text = "1"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction2(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "2"
        case 2:
            Bvalue.text = "2"
        case 3:
            Cvalue.text = "2"
        case 4:
            Dvalue.text = "2"
        case 5:
            Evalue.text = "2"
        case 6:
            Fvalue.text = "2"
        case 7:
            Gvalue.text = "2"
        case 8:
            Hvalue.text = "2"
        case 9:
            Ivalue.text = "2"
        case 10:
            Jvalue.text = "2"
        case 11:
            Kvalue.text = "2"
        case 12:
            Lvalue.text = "2"
        case 13:
            Mvalue.text = "2"
        case 14:
            Nvalue.text = "2"
        case 15:
            Ovalue.text = "2"
        case 16:
            Pvalue.text = "2"
        case 17:
            Qvalue.text = "2"
        case 18:
            Rvalue.text = "2"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction3(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "3"
        case 2:
            Bvalue.text = "3"
        case 3:
            Cvalue.text = "3"
        case 4:
            Dvalue.text = "3"
        case 5:
            Evalue.text = "3"
        case 6:
            Fvalue.text = "3"
        case 7:
            Gvalue.text = "3"
        case 8:
            Hvalue.text = "3"
        case 9:
            Ivalue.text = "3"
        case 10:
            Jvalue.text = "3"
        case 11:
            Kvalue.text = "3"
        case 12:
            Lvalue.text = "3"
        case 13:
            Mvalue.text = "3"
        case 14:
            Nvalue.text = "3"
        case 15:
            Ovalue.text = "3"
        case 16:
            Pvalue.text = "3"
        case 17:
            Qvalue.text = "3"
        case 18:
            Rvalue.text = "3"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction4(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "4"
        case 2:
            Bvalue.text = "4"
        case 3:
            Cvalue.text = "4"
        case 4:
            Dvalue.text = "4"
        case 5:
            Evalue.text = "4"
        case 6:
            Fvalue.text = "4"
        case 7:
            Gvalue.text = "4"
        case 8:
            Hvalue.text = "4"
        case 9:
            Ivalue.text = "4"
        case 10:
            Jvalue.text = "4"
        case 11:
            Kvalue.text = "4"
        case 12:
            Lvalue.text = "4"
        case 13:
            Mvalue.text = "4"
        case 14:
            Nvalue.text = "4"
        case 15:
            Ovalue.text = "4"
        case 16:
            Pvalue.text = "4"
        case 17:
            Qvalue.text = "4"
        case 18:
            Rvalue.text = "4"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction5(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "5"
        case 2:
            Bvalue.text = "5"
        case 3:
            Cvalue.text = "5"
        case 4:
            Dvalue.text = "5"
        case 5:
            Evalue.text = "5"
        case 6:
            Fvalue.text = "5"
        case 7:
            Gvalue.text = "5"
        case 8:
            Hvalue.text = "5"
        case 9:
            Ivalue.text = "5"
        case 10:
            Jvalue.text = "5"
        case 11:
            Kvalue.text = "5"
        case 12:
            Lvalue.text = "5"
        case 13:
            Mvalue.text = "5"
        case 14:
            Nvalue.text = "5"
        case 15:
            Ovalue.text = "5"
        case 16:
            Pvalue.text = "5"
        case 17:
            Qvalue.text = "5"
        case 18:
            Rvalue.text = "5"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction6(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "6"
        case 2:
            Bvalue.text = "6"
        case 3:
            Cvalue.text = "6"
        case 4:
            Dvalue.text = "6"
        case 5:
            Evalue.text = "6"
        case 6:
            Fvalue.text = "6"
        case 7:
            Gvalue.text = "6"
        case 8:
            Hvalue.text = "6"
        case 9:
            Ivalue.text = "6"
        case 10:
            Jvalue.text = "6"
        case 11:
            Kvalue.text = "6"
        case 12:
            Lvalue.text = "6"
        case 13:
            Mvalue.text = "6"
        case 14:
            Nvalue.text = "6"
        case 15:
            Ovalue.text = "6"
        case 16:
            Pvalue.text = "6"
        case 17:
            Qvalue.text = "6"
        case 18:
            Rvalue.text = "6"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }
    @IBAction func myAction7(){
        self.showAllButtons()
        self.showAllLabels()
        switch vFlag {
        case 1:
            Avalue.text = "7"
        case 2:
            Bvalue.text = "7"
        case 3:
            Cvalue.text = "7"
        case 4:
            Dvalue.text = "7"
        case 5:
            Evalue.text = "7"
        case 6:
            Fvalue.text = "7"
        case 7:
            Gvalue.text = "7"
        case 8:
            Hvalue.text = "7"
        case 9:
            Ivalue.text = "7"
        case 10:
            Jvalue.text = "7"
        case 11:
            Kvalue.text = "7"
        case 12:
            Lvalue.text = "7"
        case 13:
            Mvalue.text = "7"
        case 14:
            Nvalue.text = "7"
        case 15:
            Ovalue.text = "7"
        case 16:
            Pvalue.text = "7"
        case 17:
            Qvalue.text = "7"
        case 18:
            Rvalue.text = "7"
        default:
            break
        }//switch vFlag
        self.myCalc()
    }

    override func viewDidLoad() {
        self.hideNumberButtons()
        self.clearAllLabels()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                                                                let fetchRequest: NSFetchRequest<FIMData> = FIMData.fetchRequest()
                                                                fetchRequest.predicate = NSPredicate(format: "date = %@",detailDate)
                                                                let fetchResult = try myContext.fetch(fetchRequest)
                                                                fetchResult[0].fimIndex = "FIM " + self.SogoValue.text!
                                                                fetchResult[0].detail = detailValueString
                                                                detailString = detailValueString
                                                                fetchResult[0].memo = textField.text
                                                                detailMemo = textField.text!
                                                                let dateFormatter = DateFormatter()
                                                                dateFormatter.dateFormat = "yyyy.M.d "
                                                                let dateString = dateFormatter.string(from: detailDate as Date)
                                                                if let i = fetchResult[0].memo{
                                                                    detailHeader = dateString + " " + i + " FIM " + self.SogoValue.text!
                                                                }else{
                                                                    detailHeader = dateString + " FIM " + self.SogoValue.text!
                                                                }
                                                            }
                                                            catch {
                                                                print("Fetching Failed.")
                                                            }
                                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                                            self.navigationItem.title = "新規入力"
                                                            self.performSegue(withIdentifier: "fromFIMToDetail", sender: true)
                                                        }//if self.revisionIsActive == true
                                                        else{
                                                            let fimData:FIMData = FIMData(context: myContext)
                                                            fimData.fimIndex = "FIM " + self.SogoValue.text!
                                                            fimData.detail = detailValueString
                                                            fimData.date = NSDate() as Date
                                                            fimData.memo = textField.text
                                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                                            self.performSegue(withIdentifier: "toFIMSavedTable", sender: true)
                                                        }//else
                                                        
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",
                                                        style: UIAlertAction.Style.cancel,
                                                        handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            //   fimData.memo = ""
                                                            //   self.performSegue(withIdentifier: "toFIMSavedTable", sender: true)
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
    
    @IBAction func fromFIMDetailToFIMView(_ Segue:UIStoryboardSegue){
        revisionIsActive = true
        revisionCompleted = false
        if detailString.isEmpty == true{
            return
        }
        var arr:[String] = detailString.components(separatedBy: "\n")
        for i in 0...21{
            if Int(arr[i]) == 0{
                arr[i] = ""
            }
        }
        Avalue.text = arr[0]
        Bvalue.text = arr[1]
        Cvalue.text = arr[2]
        Dvalue.text = arr[3]
        Evalue.text = arr[4]
        Fvalue.text = arr[5]
        Gvalue.text = arr[6]
        Hvalue.text = arr[7]
        Ivalue.text = arr[8]
        Jvalue.text = arr[9]
        Kvalue.text = arr[10]
        Lvalue.text = arr[11]
        Mvalue.text = arr[12]
        Nvalue.text = arr[13]
        Ovalue.text = arr[14]
        Pvalue.text = arr[15]
        Qvalue.text = arr[16]
        Rvalue.text = arr[17]
        UndoValue.text = arr[18]
        NinchiValue.text = arr[19]
        SogoValue.text = arr[20]
        KaigoValue.text = arr[21]
        myCalc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if revisionCompleted == true{
            self.hideNumberButtons()
            self.showAllButtons()
            self.clearAllLabels()
            vFlag = 0
            for i in 0...detailArray.count-1{
                detailArray[i] = "0"
            }
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
            self.navigationItem.title = "FIM評価表"
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
