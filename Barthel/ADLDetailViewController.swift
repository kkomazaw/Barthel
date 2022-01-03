//
//  ADLDetailViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/08/11.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit

class ADLDetailViewController: UIViewController {
    
    @IBOutlet var DetailHeaderLabel:UILabel!
    @IBOutlet var ShojoAnseiDegree:UILabel!
    @IBOutlet var ShojoAnseiPoint:UILabel!
    @IBOutlet var DochirakanoteDegree:UILabel!
    @IBOutlet var DochirakanotePoint:UILabel!
    @IBOutlet var NegaeriDegree:UILabel!
    @IBOutlet var NegaeriPoint:UILabel!
    @IBOutlet var OkiagariDegree:UILabel!
    @IBOutlet var OkiagariPoint:UILabel!
    @IBOutlet var ZaihojiDegree:UILabel!
    @IBOutlet var ZaihojiPoint:UILabel!
    @IBOutlet var IjouDegree:UILabel!
    @IBOutlet var IjouPoint:UILabel!
    @IBOutlet var IdohohoDegree:UILabel!
    @IBOutlet var IdohohoPoint:UILabel!
    @IBOutlet var KokuseiketsuDegree:UILabel!
    @IBOutlet var KokuseiketsuPoint:UILabel!
    @IBOutlet var ShokujisesshuDegree:UILabel!
    @IBOutlet var ShokujisesshuPoint:UILabel!
    @IBOutlet var IfukunoChakudatsuDegree:UILabel!
    @IBOutlet var IfukunoChakudatsuPoint:UILabel!
    @IBOutlet var TashahenoIshiDegree:UILabel!
    @IBOutlet var TashahenoIshiPoint:UILabel!
    @IBOutlet var ShinryojonoShijiDegree:UILabel!
    @IBOutlet var ShinryojonoShijiPoint:UILabel!
    @IBOutlet var KikenkodoDegree:UILabel!
    @IBOutlet var KikenkodoPoint:UILabel!
    @IBOutlet var Score:UILabel!
    
    @IBOutlet var revisionCompleteLabel:UILabel!
    
    func myCalc(){
        DetailHeaderLabel.text = detailHeader
        if detailString.isEmpty == true{
            return
        }
        let arr:[String] = detailString.components(separatedBy: "\n")
        ShojoAnseiPoint.text = arr[0]
        switch arr[0] {
        case "0":
            ShojoAnseiDegree.text = "なし"
        case "1":
            ShojoAnseiDegree.text = "あり"
        default:
            break
        }
        DochirakanotePoint.text = arr[1]
        switch arr[1] {
        case "0":
            DochirakanoteDegree.text = "できる"
        case "1":
            DochirakanoteDegree.text = "できない"
        default:
            break
        }
        NegaeriPoint.text = arr[2]
        switch arr[2] {
        case "0":
            NegaeriDegree.text = "できる"
        case "1":
            NegaeriDegree.text = "何かに掴まれば可"
        case "2":
            NegaeriDegree.text = "できない"
        default:
            break
        }
        OkiagariPoint.text = arr[3]
        switch arr[3] {
        case "0":
            OkiagariDegree.text = "できる"
        case "1":
            OkiagariDegree.text = "できない"
        default:
            break
        }
        ZaihojiPoint.text = arr[4]
        switch arr[4] {
        case "0":
            ZaihojiDegree.text = "できる"
        case "1":
            ZaihojiDegree.text = "支えがあれば可"
        case "2":
            ZaihojiDegree.text = "できない"
        default:
            break
        }
        IjouPoint.text = arr[5]
        switch arr[5] {
        case "0":
            IjouDegree.text = "できる"
        case "1":
            IjouDegree.text = "見守り•一部介助"
        case "2":
            IjouDegree.text = "できない"
        default:
            break
        }
        IdohohoPoint.text = arr[6]
        switch arr[6] {
        case "0":
            IdohohoDegree.text = "介助不要"
        case "1":
            IdohohoDegree.text = "要介助"
        default:
            break
        }
        KokuseiketsuPoint.text = arr[7]
        switch arr[7] {
        case "0":
            KokuseiketsuDegree.text = "できる"
        case "1":
            KokuseiketsuDegree.text = "できない"
        default:
            break
        }
        ShokujisesshuPoint.text = arr[8]
        switch arr[8] {
        case "0":
            ShokujisesshuDegree.text = "介助なし"
        case "1":
            ShokujisesshuDegree.text = "一部介助"
        case "2":
            ShokujisesshuDegree.text = "全介助"
        default:
            break
        }
        IfukunoChakudatsuPoint.text = arr[9]
        switch arr[9] {
        case "0":
            IfukunoChakudatsuDegree.text = "介助なし"
        case "1":
            IfukunoChakudatsuDegree.text = "一部介助"
        case "2":
            IfukunoChakudatsuDegree.text = "全介助"
        default:
            break
        }
        TashahenoIshiPoint.text = arr[10]
        switch arr[10] {
        case "0":
            TashahenoIshiDegree.text = "できる"
        case "1":
            TashahenoIshiDegree.text = "時々できる"
        case "2":
            TashahenoIshiDegree.text = "できない"
        default:
            break
        }
        ShinryojonoShijiPoint.text = arr[11]
        switch arr[11] {
        case "0":
            ShinryojonoShijiDegree.text = "はい"
        case "1":
            ShinryojonoShijiDegree.text = "いいえ"
        default:
            break
        }
        KikenkodoPoint.text = arr[12]
        switch arr[12] {
        case "0":
            KikenkodoDegree.text = "ない"
        case "1":
            KikenkodoDegree.text = "ある"
        default:
            break
        }
        Score.text = arr[13]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myCalc()
        revisionCompleteLabel.text = ""
        if revisionIsActive == true{
            let date = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.M.d H:mm"
            let dateString = dateFormatter.string(from: date as Date)
            revisionCompleteLabel.text = "※" + dateString + "に修正しました"
            revisionIsActive = false
            revisionCompleted = true
        }
    }//override func viewDidLoad()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
