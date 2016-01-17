//
//  AppDelegate.swift
//  TimeZoneLocate
//
//  Created by Anthony Persaud on 01/17/2016.
//  Copyright (c) 2016 Anthony Persaud. All rights reserved.
//

import UIKit
import CoreLocation
import TimeZoneLocate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let location = CLLocation(latitude: 32.88, longitude: -117.15)
        //helper method
        let theTimeZone = location.timeZone
        print("TimeZone: \(theTimeZone.name)")
        // Or the shared method
        let timeZone = TimeZoneLocate.timeZoneWithLocation(location)
        print(timeZone)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("San Diego, CA") { (placemarks, error) -> Void in
            if error == nil, let placemarks = placemarks, placemark = placemarks.first {
                
                let locationTimeZone = placemark.location?.timeZone
                print(locationTimeZone)
                //of if country code is known, then
                if let location = placemark.location, countryCode = placemark.addressDictionary?["CountryCode"] as? String {
                    let fastTimeZone = TimeZoneLocate.timeZoneWithLocation(location, countryCode: countryCode)
                    print(fastTimeZone)
                }
                
                //Helper method

            }
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
