//
//  WebViewController.swift
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 2014/6/5.
//  Copyright (c) 2014年 klandor. All rights reserved.
//

import UIKit

@objc
class WebViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView : UIWebView
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
        
        webView.scalesPageToFit = true
        
        webView.loadRequest(NSURLRequest(URL:url))
        //webView.scrollView
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        
        let time = dispatch_walltime(nil, interval)
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        dispatch_after(time, queue, self.tryScrollToTop)
    }
    
    let interval : Int64 = 1000000
    
    func webViewDidFinishLoad(webView: UIWebView!){

    }
    
    func tryScrollToTop()
    {
        let windowHeight = webView.bounds.height
        let contentHeight = webView.scrollView.contentSize.height
        
        NSLog("windowHeight: \(windowHeight) contentHeight: \(contentHeight)")
        
        if windowHeight != contentHeight {
            NSLog("tryScrollToTop() set content")
            
            
            var point = CGPoint()
            point.y = -64
            webView.scrollView.setContentOffset(point, animated: false)
            webView.setNeedsDisplay()
        }
        else {
            NSLog("tryScrollToTop() dispatch again")
            let time = dispatch_walltime(nil, interval)
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            dispatch_after(time, queue, self.tryScrollToTop)
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
