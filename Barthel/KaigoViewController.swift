//
//  KaigoViewController.swift
//  Barthel
//
//  Created by Matsui Keiji on 2017/06/19.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit

class KaigoViewController: UIViewController {
    
    @IBOutlet var KaigoTextView:UITextView!
    
    override func viewDidLoad() {
       KaigoTextView.text = "介護保険寝たきり度\nJ: 何らかの障害等を有するが、日常生活は ほぼ自立しており独力で外出する。\n　J1: 交通機関等を利用して外出する\n　J2: 隣近所へなら外出する\nA: 屋内での生活は概ね自立しているが、介助なしには外出しない。\n　A1: 日中はほとんどベッドから離れて生活する。\n　A2: 日中も寝たり起きたりの生活をしている。\nB: 屋内での生活は何らかの介助を要し、日中もベッド上での生活が主体であるが座位を保つ。\n　B1: 介助なしで車椅子に移乗し、食事・排泄はベッドから離れて行う。\n　B2: 介助により車椅子に移乗する。\nC: 一日中ベッド上で過ごし、排泄・食事・着替えにおいて介助を要する。\n　C1: 自力で寝返りをうつ\n　C2: 自力で寝返りもうたない\n\n介護保険認知症自立度\nI: 何らかの痴呆を有するが、日常生活は家庭内及び社会的にほぼ自立している。\nIIa: 家庭外で、日常生活に支障を来すような症状・行動や意思疎通の困難さが見られても誰かが注意していれば自立できる。\nIIb: 家庭内でも上記IIの状態が見られる。\nIIIa: 日中を中心として、日常生活に支障を来すような症状・行動や意思疎通の困難さが時々見られ、介護を必要とする。\nIIIb: 夜間を中心として、日常生活に支障を来すような症状・行動や意思疎通の困難さが時々見られ、介護を必要とする。\nIV: 日常生活に支障を来すような症状・行動や意思疎通の困難さが頻繁に見られ、常に介護を必要とする。\nM: 著しい精神症状や問題行動或いは重篤な身体症状(意思疎通が全く出来ない寝たきり状態)が見られ、専門医療を必要とする。"
        self.automaticallyAdjustsScrollViewInsets = false
            super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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
