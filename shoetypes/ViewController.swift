//
//  ViewController.swift
//  shoetypes
//
//  Created by Abdelrahman on 29/09/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {

   
    @IBOutlet var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string:"https://www.shoetypes.co/") else {return}
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true

        webView.load(URLRequest(url: url))
      
        DispatchQueue.main.asyncAfter (deadline: .now()+5) {
            
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in guard let html = result as? String, error == nil else {
                return
            }
                
            }
            
        }
                
    }


}

//
//  HomeViewController.swift
//  Smai Store
//
//  Created by Abdelrahman on 8/7/21.
//

/*
import UIKit
import WebKit





class HomeViewController: UIViewController,WKNavigationDelegate{

    @IBOutlet weak var homeV: WKWebView!

    
    
    
    
    
//    @IBOutlet weak var homeV: WKWebView!
    //    @IBOutlet weak var homeV: WKWebView!
    var popupWebView: WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//              if !homeV.canGoBack
//              {
//                  backWord.setTitle("", for: .normal)
//                  backB.setImage(UIImage(named: "biyalalogonew"), for: .normal)
//
//              }
        
        
        let dictionary = NSDictionary(object: "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1", forKey: "UserAgent" as NSCopying)
        UserDefaults.standard.register(defaults: dictionary as! [String : Any])


        homeV.uiDelegate = self

           let url_Mine = URL(string: "https://smai.store/VarByv")

                             let url_Request = URLRequest(url: url_Mine!)
        
            homeV.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"

        let cookie = HTTPCookie(properties: [
            .domain: "smai.store",
            .path: "/",
            .name: "MyCookieName",
            .value: "MyCookieValue",
            .secure: "TRUE",
            .expires: NSDate(timeIntervalSinceNow: 31556926)
        ])!

        homeV.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)

        let cookies = HTTPCookieStorage.shared.cookies ?? []
        for cookie in cookies {
            homeV.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
        }

                             homeV.load(url_Request)
            homeV.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
                             homeV.navigationDelegate = self
        homeV.allowsBackForwardNavigationGestures = true
        homeV.setPullToRefresh(type: .embed)


//        homeV = WKWebView(frame: self.view.frame)
//        self.view.addSubview(self.homeV)
//        homeV.navigationDelegate = self
//        homeV.load(url_Request)




    }
    

    
    
//////////////////
    
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(
            title: message,
            message: nil,
            preferredStyle: .alert)
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: { action in
                    completionHandler()
                }))
        present(alertController, animated: true) {
        }
    }
    
    /////////////////



    
    
    
    
    
    
    
    
    



  
    
    
    
    
    
    
 



     func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {



    //        هذه الكود يجلب الرابط الذى ضغط عليه المستخدم

            let urlx = navigationAction.request.url!.absoluteString
        print (urlx)

 let dictionary = NSDictionary(object: "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1", forKey: "UserAgent" as NSCopying)
   UserDefaults.standard.register(defaults: dictionary as! [String : Any])
        homeV.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"

            if urlx.contains("telegram")
            {
                print("Done Telegram")

                UIApplication.shared.openURL(navigationAction.request.url!)
                decisionHandler(.cancel)
            }

//            else if urlx.contains("https://biyala.app/includes/social_login/google/index.php")
//
//            {
//                let url_Mine1 = URL(string: "https://biyala.app/")
//
//                                          let url_Request1 = URLRequest(url: url_Mine1!)
//
//                homeV.load(url_Request1)
//                homeV.navigationDelegate = self
//
//            }

            else if urlx.contains("mailto")
            {
                print("Done Mail To")
                UIApplication.shared.openURL(navigationAction.request.url!)
                decisionHandler(.cancel)
            }


                else if urlx.contains("linkedin")
                {
                    print("Done linkedin")
                    UIApplication.shared.openURL(navigationAction.request.url!)
                    decisionHandler(.cancel)
                }


                    else if urlx.contains("mobile.twitter.com")
                    {
                        print("Done twitter")
                        UIApplication.shared.openURL(navigationAction.request.url!)
                        decisionHandler(.cancel)
                    }


//                        else if urlx.contains("addtoany")
//                        {
//                            print("Done facebook")
//                            UIApplication.shared.openURL(navigationAction.request.url!)
//                            decisionHandler(.cancel)
//                        }
                
                else if urlx.contains("apps.apple.com")
                                       {
                                           print("Done App Store")
                                           UIApplication.shared.openURL(navigationAction.request.url!)
                                           decisionHandler(.cancel)
                                       }
                
                else if urlx.contains("play.google.com")
                {
                    print("Done Play Store")
                    UIApplication.shared.openURL(navigationAction.request.url!)
                    decisionHandler(.cancel)
                }
                
                
                
        
                

                                else if urlx.contains("instagram")
                                {
                                    print("Done instagram")
                                    UIApplication.shared.openURL(navigationAction.request.url!)
                                    decisionHandler(.cancel)
                                }
                
                
                else if urlx.contains("tel")
                                            {
                                                print("Done Telephone")
                                                UIApplication.shared.openURL(navigationAction.request.url!)
                                                decisionHandler(.cancel)
                                            }
                

                else if urlx.contains("whatsapp")
                                        {
                                            print("Done Good whatsapp")
                                            UIApplication.shared.openURL(navigationAction.request.url!)
                                            decisionHandler(.cancel)
                                        }


                                    else if urlx.contains("t.me")
                                    {
                                        
                                        print("Done t.me")
                                        UIApplication.shared.openURL(navigationAction.request.url!)
                                        decisionHandler(.cancel)
                                    }


//            else if urlx.contains("youtube") && !urlx.contains("accounts")
//                {
//                    print("Done Good youtube")
//                    UIApplication.shared.openURL(navigationAction.request.url!)
//                    decisionHandler(.cancel)
//                }





                                else {
                    homeV.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
                print(navigationAction.request.url!)
              let dictionary = NSDictionary(object: "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1", forKey: "UserAgent" as NSCopying)
               UserDefaults.standard.register(defaults: dictionary as! [String : Any])
                decisionHandler(.allow)
            }


        }






}








//
//extension ViewController: WKUIDelegate {
//
//    /**
//     * Force all popup windows to remain in the current WKWebView.
//     * By default, WKWebView is blocking new windows from being created
//     * ex <a href="link" target="_blank">text</a>.
//     * This code catches those popup windows and displays them in the current WKWebView.
//     */
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//        // open in current view
//        webView.load(navigationAction.request)
//
//        // don't return a new view to build a popup into (the default behavior).
//        return nil;
//    }
//}




extension HomeViewController: WKUIDelegate {
    
    
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
        homeV.allowsBackForwardNavigationGestures = true
//        if homeV.canGoBack
//                  {
//                      backWord.setTitle("Back", for: .normal)
//                      backB.setImage(UIImage(named: "icons8-back-30"), for: .normal)
//                  }
//                  else
//                  {
//                      backWord.setTitle("", for: .normal)
//                      backB.setImage(UIImage(named: "biyalalogonew"), for: .normal)
//                  }
        
         homeV.refreshControl?.endRefreshing()
       }


       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!,
                    withError error: Error) {
        homeV.refreshControl?.endRefreshing()
       }

       func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
           homeV.refreshControl?.endRefreshing()
       }
    
    
    
//MARK: Creating new webView for popup
func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
    popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
    popupWebView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    popupWebView!.navigationDelegate = self as? WKNavigationDelegate
    popupWebView!.uiDelegate = self as! WKUIDelegate
    view.addSubview(popupWebView!)
    return popupWebView!
}
//MARK: To close popup
func webViewDidClose(_ webView: WKWebView) {
    if webView == popupWebView {
        popupWebView?.removeFromSuperview()
        popupWebView = nil
    }
}


    
    
    





}



//
//extension WKWebView {
//
//    var refreshControl: UIRefreshControl? { (scrollView.getAllSubviews() as [UIRefreshControl]).first }
//
//    enum PullToRefreshType {
//        case none
//        case embed
//        case custom(target: Any, selector: Selector)
//    }
//
//    func setPullToRefresh(type: PullToRefreshType) {
//        (scrollView.getAllSubviews() as [UIRefreshControl]).forEach { $0.removeFromSuperview() }
//        switch type {
//            case .none: break
//            case .embed: _setPullToRefresh(target: self, selector: #selector(webViewPullToRefreshHandler(source:)))
//            case .custom(let params): _setPullToRefresh(target: params.target, selector: params.selector)
//        }
//    }
//
//    private func _setPullToRefresh(target: Any, selector: Selector) {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(target, action: selector, for: .valueChanged)
//        scrollView.addSubview(refreshControl)
//    }
//
//    @objc func webViewPullToRefreshHandler(source: UIRefreshControl) {
//        guard let url = self.url else { source.endRefreshing(); return }
//        load(URLRequest(url: url))
//    }
//}
//
//// https://stackoverflow.com/a/47282118/4488252
//
//extension UIView {
//
//    class func getAllSubviews<T: UIView>(from parenView: UIView) -> [T] {
//        return parenView.subviews.flatMap { subView -> [T] in
//            var result = getAllSubviews(from: subView) as [T]
//            if let view = subView as? T { result.append(view) }
//            return result
//        }
//    }
//
//    func getAllSubviews<T: UIView>() -> [T] { return UIView.getAllSubviews(from: self) as [T] }
//}
//
//
//

*/

