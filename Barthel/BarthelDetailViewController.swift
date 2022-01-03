//
//  BarthelDetailViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/07/30.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit

class BarthelDetailViewController: UIViewController {
    
    @IBOutlet var DetailHeaderLabel:UILabel!
    @IBOutlet var ShokujiDegreeLabel:UILabel!
    @IBOutlet var ShokujiPointLabel:UILabel!
    @IBOutlet var ToireDegreeLabel:UILabel!
    @IBOutlet var ToirePointLabel:UILabel!
    @IBOutlet var KaidanDegreeLabel:UILabel!
    @IBOutlet var KaidanPointLabel:UILabel!
    @IBOutlet var KouiDegreeLabel:UILabel!
    @IBOutlet var KouiPointLabel:UILabel!
    @IBOutlet var HaibenDegreeLabel:UILabel!
    @IBOutlet var HaibenPointLabel:UILabel!
    @IBOutlet var HainyoDegreeLabel:UILabel!
    @IBOutlet var HainyouPointLabel:UILabel!
    @IBOutlet var SeiyoDegreeLabel:UILabel!
    @IBOutlet var SeiyoPointLabel:UILabel!
    @IBOutlet var NyuyokuDegreeLabel:UILabel!
    @IBOutlet var NyuyokuPointLabel:UILabel!
    @IBOutlet var IjouDegreeLabel:UILabel!
    @IBOutlet var IjouPointLabel:UILabel!
    @IBOutlet var HeichiDegreeLabel:UILabel!
    @IBOutlet var HeichiPointLabel:UILabel!
    @IBOutlet var GokeiPointLabel:UILabel!
    @IBOutlet var HaiyoShokogunLabel:UILabel!
    
    @IBOutlet var revisionCompleteLabel:UILabel!
    
    func myCalc(){
        DetailHeaderLabel.text = detailHeader
        if detailString.isEmpty == true{
            return
        }
        let arr:[String] = detailString.components(separatedBy: "\n")
        ShokujiPointLabel.text = arr[0]
        switch arr[0] {
        case "10":
            ShokujiDegreeLabel.text = "自立"
        case "5":
            ShokujiDegreeLabel.text = "一部"
        case "0":
            ShokujiDegreeLabel.text = "全介助"
        default:
            break
        }
        ToirePointLabel.text = arr[1]
        switch arr[1] {
        case "10":
            ToireDegreeLabel.text = "自立"
        case "5":
            ToireDegreeLabel.text = "一部"
        case "0":
            ToireDegreeLabel.text = "全介助"
        default:
            break
        }
        KaidanPointLabel.text = arr[2]
        switch arr[2] {
        case "10":
            KaidanDegreeLabel.text = "自立"
        case "5":
            KaidanDegreeLabel.text = "一部"
        case "0":
            KaidanDegreeLabel.text = "全介助"
        default:
            break
        }
        KouiPointLabel.text = arr[3]
        switch arr[3] {
        case "10":
            KouiDegreeLabel.text = "自立"
        case "5":
            KouiDegreeLabel.text = "一部"
        case "0":
            KouiDegreeLabel.text = "全介助"
        default:
            break
        }
        HaibenPointLabel.text = arr[4]
        switch arr[4] {
        case "10":
            HaibenDegreeLabel.text = "自立"
        case "5":
            HaibenDegreeLabel.text = "一部"
        case "0":
            HaibenDegreeLabel.text = "全介助"
        default:
            break
        }
        HainyouPointLabel.text = arr[5]
        switch arr[5] {
        case "10":
            HainyoDegreeLabel.text = "自立"
        case "5":
            HainyoDegreeLabel.text = "一部"
        case "0":
            HainyoDegreeLabel.text = "全介助"
        default:
            break
        }
        SeiyoPointLabel.text = arr[6]
        switch arr[6] {
        case "5":
            SeiyoDegreeLabel.text = "自立"
        case "0":
            HainyoDegreeLabel.text = "介助"
        default:
            break
        }
        NyuyokuPointLabel.text = arr[7]
        switch arr[7] {
        case "5":
            NyuyokuDegreeLabel.text = "自立"
        case "0":
            NyuyokuDegreeLabel.text = "介助"
        default:
            break
        }
        IjouPointLabel.text = arr[8]
        switch arr[8] {
        case "15":
            IjouDegreeLabel.text = "自立"
        case "10":
            IjouDegreeLabel.text = "監視下"
        case "5":
            IjouDegreeLabel.text = "座れる"
        case "0":
            IjouDegreeLabel.text = "全介助"
        default:
            break
        }
        HeichiPointLabel.text = arr[9]
        switch arr[9] {
        case "15":
            HeichiDegreeLabel.text = "自立"
        case "10":
            HeichiDegreeLabel.text = "歩行器"
        case "5":
            HeichiDegreeLabel.text = "車いす"
        case "0":
            HeichiDegreeLabel.text = "全介助"
        default:
            break
        }
        GokeiPointLabel.text = arr[10]
        if Int(arr[10])! <= 85{
            HaiyoShokogunLabel.text = "廃用症候群"
        }
        else{
            HaiyoShokogunLabel.text = ""
        }
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
    
 /*   @IBAction func fromBarthelViewToDetail(_ Segue:UIStoryboardSegue){
        myCalc()
    }*/
    
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
