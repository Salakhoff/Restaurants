import Foundation

protocol NetworkProtocol {
    func fetchData<T: Codable>(
        url: URL,
        httpMethod: HTTPMethod,
        body: Encodable?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

final class NetworkService: NetworkProtocol {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let session: URLSession
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 250
        session = URLSession(configuration: configuration)
    }
    
    func fetchData<T: Codable>(
        url: URL,
        httpMethod: HTTPMethod,
        body: Encodable?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let body = body {
            do {
                request.httpBody = try encoder.encode(body)
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
                request.setValue("ecde814128msh766c87147e0a84ap19dee9jsnc86c132e3bc2", forHTTPHeaderField: "X-RapidAPI-Key")
                request.setValue("worldwide-restaurants.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
            } catch {
                completion(.failure(.badEncode))
            }
        }
        
        session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.badData))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(.badResponse))
            }
            
            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedData = try self.decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.badDecode))
                }
            case 400:
                completion(.failure(.badRequest))
            case 403:
                completion(.failure(.forbidden))
            case 404:
                completion(.failure(.notFound))
            case 500...599:
                completion(.failure(.serverError))
            default:
                completion(.failure(.unknown("Дефолтная ошибка.")))
            }
        }.resume()
    }
}
