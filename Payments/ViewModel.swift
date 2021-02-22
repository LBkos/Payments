import Foundation
import SwiftyJSON
import Alamofire
import Combine

class ViewModel: ObservableObject {
    
    private var concellables = Set<AnyCancellable>()
    @Published var login = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var responseData: [Response]? = []
    @Published var tokens: Token? 
    @Published var success = false
    
    
    
    let url = URL(string: "http://82.202.204.94/api/")
    let headers = HTTPHeaders(["app-key" : "12345", "v" : "1"])
    var parameters = [
            "login": "",
            "password": ""
        ]
    
    
    func getTokenApi(completion: @escaping (Token?)-> Void) {[self]
        parameters["login"] = login
        parameters["password"] = password
//request token
        AF.request("\(url!)login", method: .post, parameters: parameters , headers: headers).validate().response { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                tokens = Token(fromJson: json)
                if tokens?.success == true {
                    getDataApi(token: (tokens?.response?.token ?? ""), completion: { [self] result in
                        responseData = result
                    })
                } else {
                    errorMessage = tokens?.error?.errorMsg ?? ""
                }
                completion(tokens)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.resume()
    }
    func getDataApi(token: String, completion: @escaping ([Response]?)-> Void) {
        //request data
        
        print("\(url!)payments?token=\(token)")
        AF.request("\(url!)payments?token=\(token)", method: .get, parameters: parameters , headers: headers).validate().response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                let data = ApiData(fromJson: json)
                self.success = data.success
                completion(data.response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.resume()
    }
}
