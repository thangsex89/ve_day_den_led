//
//  ViewController.swift
//  Ve_day_den_led
//
//  Created by Thang on 12/5/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textf_ball_number: UITextField!
    var n = 0;
     var khoangcach_hang: Float = 40 ;
    var khoangcach_cot: Float = 80;
    var led_last_on :Int = 0
    @IBAction func btn_draw(_ sender: UIButton) {
     if (textf_ball_number.text?.isEmpty)!
     {
         n  = 0;
     }else
     {
       n = Int(textf_ball_number.text!)!
       
         Drawball(soluongbong: n)
    }
       
        
      
        
    }
    
    @IBAction func btn_turn_on_led(_ sender: UIButton) {
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runningled), userInfo: nil, repeats: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // start
        
     
        
        //end
        // Do any additional setup after loading the view, typically from a nib.
    }
    func runningled() ->  Void {
        print ("runningled")
        
        if ( led_last_on != -1)
        {
            turn_off_led()
        }
        if (led_last_on !=  GetNumberball() - 1 )
        {
            led_last_on = led_last_on + 1
        }else
        {
            led_last_on = 0
            
        }
        turn_on_led()
        // led chạy tử phải sang trái ( add gán biến GetNumberball() - 1 )
//
//        if ( led_last_on != -1)
//        {
//            turn_off_led()
//        }
//        if (led_last_on !=  0 )
//        {
//            led_last_on = led_last_on - 1
//        }else
//        {
//            led_last_on = GetNumberball() - 1
//            
//        }
//        turn_on_led()
        
    }
    func  turn_on_led () -> Void {
       if  let ball = self.view.viewWithTag(100 + led_last_on)
        as? UIImageView
       {
        
      ball.image = UIImage(named: "green@2x")
        
     }
    }
    func turn_off_led() -> Void  {
        if  let ball = self.view.viewWithTag(100 + led_last_on)
            as? UIImageView
        {
            
            ball.image = UIImage(named: "grey@2x")
            
        }

    }
    func GetNumberball() -> Int {
         var   n = Int(textf_ball_number.text!)!
        return n
    }
    func Space_between_baal_hang( soluongbong : Int ) -> Float {
        var space : Float = 0;
//        let space = self.view.bounds.size.width - 2 *_margin
        if (soluongbong == 1)
        {
            space = ((Float(self.view.bounds.size.width)  - 2 * khoangcach_hang))
        }else
        {
         space = ((Float(self.view.bounds.size.width)  - 2 * khoangcach_hang) / Float(soluongbong - 1 ))
        }
       return space
        
    }
    func Space_between_baal_cot (soluongbong : Int ) -> Float {
        var space : Float = 0;
        //        let space = self.view.bounds.size.width - 2 *_margin
        if (soluongbong == 1)
        {
            space = ((Float(self.view.bounds.size.height)  - 2 * khoangcach_cot))
        }else
        {
            space = ((Float(self.view.bounds.size.height)  - 2 * khoangcach_cot) / Float(soluongbong - 1 ))
        }
        return space
    }

        func Drawball ( soluongbong : Int ) -> Void {
        
            var space_hang = Int(Space_between_baal_hang(soluongbong : soluongbong ))
              var space_cot = Int(Space_between_baal_cot(soluongbong : soluongbong ))
        for indexhang in 0..<soluongbong
        {
            for intdexcot in 0..<soluongbong
            {
            let image =  UIImage(named: "green@2x") // tao ra 1 bien image chua anh green.
            let ball =  UIImageView (image : image)
            
            ball.center = CGPoint(x: Int(khoangcach_hang) +  indexhang * space_hang, y:  Int(khoangcach_cot) +  intdexcot * space_cot)
                ball.tag = indexhang + 100
            self.view.addSubview(ball) // hien thi anh ball len tren man hinh
            }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

