//
//  ViewController.swift
//  myNotification(Local&Push)
//
//  Created by mahmoud khudairi on 4/13/17.
//  Copyright © 2017 mahmoud khudairi. All rights reserved.
//
// alpha for 10 numbers for 9
import UIKit
//a
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: Any) {
     // oldLocalNotification()
        newLocalNotification()
    }
    func newLocalNotification(){
       //b permission
       let notificationCenter = UNUserNotificationCenter.current()
        let notificationAuthOption : UNAuthorizationOptions = [.alert,.sound]
        
        notificationCenter.requestAuthorization(options: notificationAuthOption) { (authorized, error) in
             //c check if permission allowed
            if authorized {
                //d creat a content for notification
                let notificationContent = UNMutableNotificationContent()
                notificationContent.title = "New Notification"
                notificationContent.subtitle = "Hey this is ios 10 !!"
                notificationContent.body = "lol"
                notificationContent.sound = UNNotificationSound.default()
                
                //i triggers
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                //e creat request
                let notificationRequest = UNNotificationRequest(identifier: "hiddenMessage", content: notificationContent, trigger: trigger)
                //d
                notificationCenter.add(notificationRequest, withCompletionHandler: nil)
            }
        }
       
    
    }
    func oldLocalNotification() {
        //ios 9 and before
        // 1 creat instance of UILocal
        let userNotificationSettings = UIUserNotificationSettings(types: .alert, categories: nil)
        UIApplication.shared.registerUserNotificationSettings(userNotificationSettings)
        let notification = UILocalNotification()
        //3
        notification.alertTitle = "hey :)"
        notification.alertBody = "hey this is Local Notification!!"
        //4 in appdelegate
        //2 options for notification under shared
        //present directly
        //UIApplication.shared.presentLocalNotificationNow(notification)
        notification.fireDate = Date(timeInterval: 10, since: Date())
        //5 add additional inf
        notification.userInfo = ["hiddenMessage":"this is Test"]
        //notification.repeatInterval = .minute
        UIApplication.shared.scheduleLocalNotification(notification)
    }
}

