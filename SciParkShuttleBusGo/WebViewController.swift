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
    var webView : WKWebView?
    var url: NSURL? {
        willSet{
        }
    }
    
    init(coder decoder: NSCoder!){
        super.init(coder: decoder)
        //automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let view = self.view{
            webView = WKWebView(frame:view.frame)
            view.addSubview(webView)
            webView!.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
            
            webView!.loadRequest(NSURLRequest(URL:url))
        }
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
