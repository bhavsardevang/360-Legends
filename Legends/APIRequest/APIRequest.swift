//
//  WelcomeViewModel.swift
//  Legends
//
//   on 09/04/21.
//

import Foundation
import UIKit
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
class APIRequest: NSObject {
    static let shared = APIRequest()
    private override init() {

    }

    func getAPIRequest<T:Decodable>(serviceName: String,success successBlock: @escaping ((T) -> Void), failure failureBlock: @escaping ((String) -> Void)) {

        let allURLData = serviceName.components(separatedBy: "/")
        let strLastURl:String = allURLData.last!
        print("Last Object=\(strLastURl)")
        let checkInterNet:Bool =  Connectivity.isConnectedToInternet()

        var headers:HTTPHeaders?
        print("Service Name = \(serviceName)")
               let credentialData = "\(usernameapi):\(passwordapi)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!

               let base64Credentials = credentialData.base64EncodedString()
                   headers = [
                           "Authorization": "Basic \(base64Credentials)",
                           "Accept": "application/json",
                           "Content-Type": "application/json" ]

        if checkInterNet == true {

            Alamofire.request(serviceName, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (responsed) in
                switch responsed.result { //DataResponse<Any>

                case .success(_):
                     print("Json Response= \(responsed)")
                    if responsed.response?.statusCode == 200 || responsed.response?.statusCode == 201 {
                        do {

//                            if let json = try JSONSerialization.jsonObject(with: responsed.data!, options: .allowFragments) as? [String: Any] { //[]
//                                // try to read out a string array
//                                print("Data = \(json)")
//                            }

                            let obj = try JSONDecoder().decode(T.self , from: responsed.data!)
                            successBlock(obj)
                        }
                        catch {
                            failureBlock("API response not coming please try again")
                        }
                    }
//                    else if responsed.response?.statusCode == 203 {
//                          failureBlock("Calls are limited to 1 per second, 60 per minute and 5000 per day")
//                    }
                    else
                    {
                        failureBlock("API response not coming please try again")
                    }
                    break
                case .failure(let error):
                    debugPrint("getEvents error: \(error)")

                    failureBlock(error.localizedDescription)
                    break
                @unknown default:
                    print("")
                }
            }
        }
        else {
             failureBlock("Please check your Internet Connection")
        }
    }

    func postAPIRequestWithAuth<T:Decodable>(serviceName: String,httpMethod:String, andParams params: [String:Any], success successBlock: @escaping ((T) -> Void), failure failureBlock: @escaping ((String) -> Void)) {


        var allData = [[String:Any]]()
        allData.append(params)
        let jsonData = try? JSONSerialization.data(withJSONObject: allData)

        let credentialData = "\(usernameapi):\(passwordapi)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!

        let base64Credentials = credentialData.base64EncodedString()

        let   headers = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/json" ]

        // create post request
        let url = URL(string: serviceName)!
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod//"POST"
        request.allHTTPHeaderFields = headers
        // insert json data to the request
        request.httpBody = jsonData



        print("ParaMeter = \(params)")


        let checkInterNet:Bool =  Connectivity.isConnectedToInternet()
        if checkInterNet == true {

            let task = URLSession.shared.dataTask(with:request) { data,response,error in

                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    failureBlock(error!.localizedDescription)
                    return
                }
                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] { //[]
//                    // try to read out a string array
//                    print("Data = \(json)")
//                    }
                    let obj = try JSONDecoder().decode(T.self , from: data)
                    successBlock(obj)
                }
                catch {
                    failureBlock("API response not coming please try again")
                }

            }

            task.resume()

        }
        else {
            failureBlock("Please check your Internet Connection")
        }
    }

    func postAPIRequestWithoutAuth<T:Decodable>(serviceName: String,httpMethod:String, andParams params: [String:Any], success successBlock: @escaping ((T) -> Void), failure failureBlock: @escaping ((String) -> Void)) {
        print("All ParaMeter = \(params)")

       if Connectivity.isConnectedToInternet() {
        Alamofire.request(serviceName, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (responsed) in
               switch responsed.result { //DataResponse<Any>

               case .success(_):

                   if responsed.response?.statusCode == 200 || responsed.response?.statusCode == 201 {
                       do {

//                           if let json = try JSONSerialization.jsonObject(with: responsed.data!, options:.allowFragments) as? [String: Any] { //[]
//                               // try to read out a string array
//                               print("Data = \(json)")
//                            let result:Bool = (json["result"] != nil)
//                             //  let value:Int = json["result"] as! Int
//                               if  result == false {
//                                   let message = json["msg"] as! String
//                                   failureBlock(message as AnyObject)
//                                   break
//                               }
//                           }

                           let obj = try JSONDecoder().decode(T.self , from: responsed.data!)
                           successBlock(obj)
                       }
                       catch {
                           failureBlock("API response not coming please try again")
                       }
                   }
                   else
                   {
                       failureBlock("API response not coming please try again")
                   }
                   break
               case .failure(let error):
                   debugPrint("getEvents error: \(error)")

                   failureBlock(error.localizedDescription)
                   break
               @unknown default:
                   print("")
               }
           }
       }
        else {
            failureBlock("Please check your Internet Connection")
        }
    }
    

       func uploadImages<T:Decodable>(_ url: String, param: [String: Any], success successBlock: @escaping ((T) -> Void), failure failureBlock: @escaping ((String) -> Void)) {

           let checkInterNet:Bool = Connectivity.isConnectedToInternet()

           if checkInterNet == true {

               let headers = ["Content-type": "multipart/form-data", //"application/x-www-form-urlencoded",//"multipart/form-data",
                                "Content-Disposition" : "form-data"
                            ]
               Alamofire.upload(multipartFormData: { (multipartFormData) in
                   for (key, value) in param {
                       print("keys = \(key)")
                       if key == "files" {
                           for objData in value as! [Data] {
                               multipartFormData.append(objData, withName: key, fileName: "image.jpeg",mimeType: "image/jpeg")
                           }
                       }
                       else if value is String {
                           multipartFormData.append( (value as! String).data(using: .utf8)!, withName: key)
                       }
                   }
               }, usingThreshold: UInt64(), to: url, method: .post,headers: headers) { (encodingResult) in
                   print("Encoding Result = \(encodingResult)")
                   switch encodingResult {
                   case .success(let upload,_,_):
                       upload.validate().responseJSON { (responsed) in
                           if responsed.result.isSuccess {
                               if responsed.response?.statusCode == 200 {
                                   do {

                                       if let json = try JSONSerialization.jsonObject(with: responsed.data!, options:.allowFragments) as? [String: Any] {
                                           print("Response Data = \(json)")

                                           if let result = json["result"] as? Bool, result == false {
                                               if let message = json["msg"] as? String {
                                                   failureBlock(message)
                                               } else {
                                                   failureBlock("API response not coming please try again")
                                               }
                                               return
                                           }
                                       }

                                       let obj = try JSONDecoder().decode(T.self , from: responsed.data!)
                                       successBlock(obj)
                                   }
                                   catch {
                                       failureBlock("API response not coming please try again")
                                   }
                               }
                               else
                               {
                                   failureBlock("API response not coming please try again")
                               }
                           } else if responsed.result.isFailure {
                               debugPrint("getEvents error: \(responsed.result.error.debugDescription)")
                            failureBlock(responsed.result.error!.localizedDescription)
                           }
                       }

                       break
                   case .failure(let encodingError):
                       print("Response object = \(encodingError.localizedDescription)")
                       //completion(nil, encodingError)
                       break
                   }
               }
           }
           else {
               failureBlock("Please check your Internet Connection ")
           }
    }

    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }



}
