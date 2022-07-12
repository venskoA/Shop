//
//  UnifiedRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

//import Foundation
//
//protocol RequestProtocolUnified {
//    var configureUrl: ConfURLProtocol { get }
//    var session: URLSession { get set }
//    var decoder: JSONDecoder { get set }
//    func loadDataOverTheNetwork(data: SendAddReviewM
//                                ,
//              completion: @escaping ((Result<ResponseChangeModel, Error>) -> ()))
//}
//
//class AddReviewRequest: RequestProtocolUnified {
//    var configureUrl: ConfURLProtocol
//    var session: URLSession = URLSessionRequest.session
//    var decoder = JSONDecoder()
//
//    init(configUrl: ConfURLProtocol) {
//        self.configureUrl = configUrl
//    }
//
//    func loadDataOverTheNetwork(data: SendAddReview,
//                                completion: @escaping ((Result<ResponseChangeModel, Error>) -> ())) {
//        var url: URL
//        let param: [String: String] = ["text": data.text,
//                                       "id_user": String(data.idUser ?? 0) ]
//
//        do {
//            url = try configureUrl.configure(param: param, path: .change)
//        } catch {
//            completion(.failure(ErrorMyCastom.errorUrlComponent))
//            return
//        }
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                completion(.failure(ErrorMyCastom.errorAddReview))
//                return
//            }
//
//            do {
//                let result = try self.decoder.decode(ResponseChangeModel.self, from: data)
//                return completion(.success(result))
//            } catch {
//                return completion(.failure(ErrorMyCastom.errorAddReview))
//            }
//        }
//        task.resume()
//    }
//}
