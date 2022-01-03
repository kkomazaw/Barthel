//
//  FIMDetailViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/08/06.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit

class FIMDetailViewController: UIViewController {
    
    @IBOutlet var DetailHeaderLabel:UILabel!
    @IBOutlet var ShokujiLabel:UILabel!
    @IBOutlet var SeiyoLabel:UILabel!
    @IBOutlet var SeishikiLabel:UILabel!
    @IBOutlet var KouiJohanshinLabel:UILabel!
    @IBOutlet var KouiKahanshinLabel:UILabel!
    @IBOutlet var ToireSelfCareLabel:UILabel!
    @IBOutlet var HainyoContLabel:UILabel!
    @IBOutlet var HaibenContLabel:UILabel!
    @IBOutlet var BedTransLabel:UILabel!
    @IBOutlet var ToireTransLabel:UILabel!
    @IBOutlet var YokusoLabel:UILabel!
    @IBOutlet var HokoKurumaisuLabel:UILabel!
    @IBOutlet var KaidanLabel:UILabel!
    @IBOutlet var RikaiShichokakuLabel:UILabel!
    @IBOutlet var HyoshutsuOnseiLabel:UILabel!
    @IBOutlet var ShakiKoryuLabel:UILabel!
    @IBOutlet var MondaiKaiketsuLabel:UILabel!
    @IBOutlet var KiokuLabel:UILabel!
    @IBOutlet var UndoKomokuLabel:UILabel!
    @IBOutlet var NinchiKomokuLabel:UILabel!
    @IBOutlet var SogoKomokuLabel:UILabel!
    @IBOutlet var KaigoJikanLabel:UILabel!
    
    @IBOutlet var revisionCompleteLabel:UILabel!
    
    func myCalc(){
        DetailHeaderLabel.text = detailHeader
        if detailString.isEmpty == true{
            return
        }
        var arr:[String] = detailString.components(separatedBy: "\n")
        for i in 0...17{
            if Int(arr[i]) == 0{
                arr[i] = ""
            }
        }
        ShokujiLabel.text = arr[0]
        SeiyoLabel.text = arr[1]
        SeishikiLabel.text = arr[2]
        KouiJohanshinLabel.text = arr[3]
        KouiKahanshinLabel.text = arr[4]
        ToireSelfCareLabel.text = arr[5]
        HainyoContLabel.text = arr[6]
        HaibenContLabel.text = arr[7]
        BedTransLabel.text = arr[8]
        ToireTransLabel.text = arr[9]
        YokusoLabel.text = arr[10]
        HokoKurumaisuLabel.text = arr[11]
        KaidanLabel.text = arr[12]
        RikaiShichokakuLabel.text = arr[13]
        HyoshutsuOnseiLabel.text = arr[14]
        ShakiKoryuLabel.text = arr[15]
        MondaiKaiketsuLabel.text = arr[16]
        KiokuLabel.text = arr[17]
        UndoKomokuLabel.text = arr[18] + "点"
        NinchiKomokuLabel.text = arr[19] + "点"
        SogoKomokuLabel.text = arr[20] + "点"
        KaigoJikanLabel.text = arr[21] + "分"
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
    
  /*  @IBAction func fromFIMViewToDetail(_ Segue:UIStoryboardSegue){
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
