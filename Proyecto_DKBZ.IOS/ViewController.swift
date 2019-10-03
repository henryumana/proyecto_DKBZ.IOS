//
//  ViewController.swift
//  Proyecto_DKBZ.IOS
//
//  Created by Invitado on 10/2/19.
//  Copyright © 2019 Invitado. All rights reserved.
//

import UIKit
import WebKit

 class ViewController: UIViewController {
     
    
  @IBOutlet weak var inglesButton: UILabel!
  @IBOutlet weak var españolButton: UIButton!
  @IBOutlet weak var portuguesButton: UIButton!
    
    private var webView: WKWebView?

    override func loadView() {
        webView = WKWebView()

    
        view = webView
    }
    

    @IBAction func inglesButtonPressed(_ sender: Any) {
        guard let url = URL(string: "https://dkbz-dummy-api.herokuapp.com/")else{
            fatalError("Error getting URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let Session = URLSession.shared
        Session.dataTask(with: url){(data, response, error) in
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any]{
                        if  let  value = dict["value"] as? String{
                            DispatchQueue.main.async {
                                self.inglesButton.text = value
                                
                            }
                        }
                    }
                }catch{
                    print(error)
                }
               
            }
            }.resume()
        presentacion(answers:"eng")
    }
   
  
   
    @IBAction func español(_ sender: Any) {
     guard let url = URL(string: "https://dkbz-dummy-api.herokuapp.com/")else{
         fatalError("Error getting URL")
     }
     var request = URLRequest(url: url)
     request.httpMethod = "GET"
     let Session = URLSession.shared
     Session.dataTask(with: url){(data, response, error) in
         if let data = data{
             do{
                 let json = try JSONSerialization.jsonObject(with: data, options: [])
                 if let dict = json as? [String: Any]{
                     if  let  value = dict["value"] as? String{
                         DispatchQueue.main.async {
                             self.inglesButton.text = value
                             
                         }
                 }
             }
         }catch{
             print(error)
         }
        
     }
     }.resume()
        presentacion(answers:"esp")
    }
    
    @IBAction func portugues(_ sender: Any) {
        guard let url = URL(string: "https://dkbz-dummy-api.herokuapp.com/")else{
            fatalError("Error getting URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let Session = URLSession.shared
        Session.dataTask(with: url){(data, response, error) in
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any]{
                        if  let  value = dict["value"] as? String{
                            DispatchQueue.main.async {
                                self.inglesButton.text = value
                                
                            }
                        }
                    }
                }catch{
                    print(error)
                }
               
            }
            }.resume()
        presentacion(answers:"por")
    }
    
    func presentacion(answers:String){
        super.viewDidLoad()
        
        if let url = URL(string: "https://dkbz-dummy-api.herokuapp.com?lang=" + answers) {
            let req = URLRequest(url: url)
            webView?.load(req)
        }
    }
    
    
}
    
