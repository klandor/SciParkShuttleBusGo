//
//  WebViewController.swift
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 2014/6/5.
//  Copyright (c) 2014年 klandor. All rights reserved.
//

import UIKit
import WebKit

@objc
class WebViewController: UIViewController {
    var url: NSURL? {
        willSet{
        }
    }
    
    convenience init(){
        self.init(coder: nil)
    }
    
    init(coder decoder: NSCoder!){
        super.init(coder: decoder)
        //automaticallyAdjustsScrollViewInsets = false
    }
    
    override func loadView() {

        if usingWebKit() {
            self.view = WKWebView()
        }
        else {
            self.view = UIWebView()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view{
            if usingWebKit() {
                var webView = view as WKWebView
                
                webView.loadRequest(NSURLRequest(URL:url))
            }
            else {
                var webView = view as UIWebView           
                
                webView.loadRequest(NSURLRequest(URL:url))
            }
        }
    }
    
    func usingWebKit() -> Bool{
        if let systemVersion = UIDevice.currentDevice()!.systemVersion {
            let version = systemVersion.componentsSeparatedByString(".")[0] as String
            let versionInt = version.toInt()
            
            return versionInt >= 8
        }
        
        return false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        if self.isViewLoaded() && self.view.window == nil {
            self.view = nil
        }
    }
    
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
