//
//  ServiceCall.swift
//  IOS_Cousework
//
//  Created by Dilmi on 2024-03-26.
//

import SwiftUI
import UIKit

class ServiceCall
{
    class func post(parameter: NSDictionary, path: String, isToken: Bool = false, withSuccess: @escaping((_ responseObj: AnyObject?) ->() ), failure: @escaping ( (_ error: Error?) ->() ) )
    {
        DispatchQueue.global(qos: .userInitiated).async {
           
            var parameterData = NSMutableData()
            let dictKey = parameter.allKeys as! [String]
            
            var i = 0;
            
            for dictKey in dictKey{
                if let values = parameter.value(forKey: dictKey) as? String{
                    parameterData.append( String.init(format: "%@%@=%@", i == 0 ? "" : "&", dictKey, values.replacingOccurrences(of: "+", with: "%2B")).data(using: .utf8)!)
                }
                else
                {
                    parameterData.append(String.init(format: "%@%@=%@", i == 0 ? "" : "&", dictKey, parameter.value(forKey: dictKey) as! CVarArg) .data(using: String.Encoding.utf8)!)
                }
                
                i += 1
            }
            
            var request = URLRequest(url: URL(string: path)!,timeoutInterval: 20)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            //var request = NSMutableURLRequest(url: NSURL(string: path)! as URL,
                                                    //cachePolicy: .useProtocolCachePolicy,
                                                //timeoutInterval: 10.0)
            
            //if(isToken)
            //{
                //request.addValue( Main_ViewModel.shared.userObj.authToken, forHTTPHeaderField: "access_token")
            //}
            
            request.httpMethod = "POST"
            //request.allHTTPHeaderFields = headers
            request.httpBody = parameterData as Data

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                
              if let error = error
                {
                  DispatchQueue.main.async {
                      failure(error)
                  }
              } 
                else
                {
                //let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                    if let data = data
                    {
                        do{
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                            
                            debugPrint("response: ", jsonDictionary)
                            DispatchQueue.main.async {
                                withSuccess(jsonDictionary)
                            }
                        }
                        catch
                        {
                            DispatchQueue.main.async{
                                failure(error)
                            }
                        }
                    }
              }
                guard let data = data else{
                    return
                }
            }

            dataTask.resume()
              }
    }
}


