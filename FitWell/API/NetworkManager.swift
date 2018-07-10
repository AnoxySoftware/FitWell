//
//  NetworkManager.swift
//  Air100
//
//  Created by Lefteris Haritou on 13/03/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Alamofire
import JGProgressHUD

public enum Environment : String {
    case Staging, Production
    
    public var baseURL: URL {
        switch self {
        case .Staging: return URL(string: "https://api.myjson.com/bins/")!
        case .Production: return URL(string: "https://production.server.com/")!
        }
    }
}

class NetworkManager: NSObject {
    private var hud : JGProgressHUD!
    static let shared = NetworkManager()
    open var environment = Environment.Staging
    
    typealias RequestCompletion = (_ json: Data?) -> Void
    
    override init() {
        hud = JGProgressHUD(style: .light)
        hud.textLabel.text = NSLocalizedString("Loading", comment: "loading string")
        hud.vibrancyEnabled = true
        hud.shadow = JGProgressHUDShadow(color: .black, offset: .zero, radius: 5.0, opacity: 0.2)
    }
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    private func performRequest(urlString:String,method:HTTPMethod, parameters:[String:Any]?, encoding:ParameterEncoding = JSONEncoding.default, completion: @escaping RequestCompletion) {
        if let topView = UIHelper.topViewController()?.view, !hud.isVisible {
            hud.show(in:topView, animated: true)
        }
        
        let requestUrlString = environment.baseURL.appendingPathComponent(urlString).absoluteString
        
        sessionManager.request(requestUrlString, method: method, parameters: parameters, encoding: encoding).responseJSON {[weak self] response in
            guard let strongSelf = self else {return}
            strongSelf.hud.dismiss(afterDelay: 0.1, animated: true)
            
            if response.response?.statusCode != 200, let error = response.error {
                strongSelf.showError(error,nil)
            }
            else if let data = response.data {
                completion(data)
                return
            }
            
            completion(nil)
        }
    }
    
    private func showError(_ error:Error?, _ message:String?) {
        let errorMessage = error?.localizedDescription ?? NSLocalizedString(message ?? "",comment:"")
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: String(format:"%@\n\n%@",NSLocalizedString("An error occured:", comment: ""),errorMessage), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        
        if let topViewController = UIHelper.topViewController() {
            DispatchQueue.main.async {
                topViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func fetchRaces(completion: @escaping RequestCompletion) {
        //hardcoded for example only
        let urlString = "rg5uy"
        let requestMethod = HTTPMethod.get
        self.performRequest(urlString: urlString, method: requestMethod, parameters: nil,encoding: JSONEncoding.default, completion: completion)
    }

    
    func fetchProfile(completion: @escaping RequestCompletion) {
        //hardcoded for example only
        let urlString = "https://randomuser.me/api/"
        let requestMethod = HTTPMethod.get
        self.performRequest(urlString: urlString, method: requestMethod, parameters: nil,encoding: JSONEncoding.default, completion: completion)
    }
}
