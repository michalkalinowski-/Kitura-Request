//  Copyright (c) 01/06/16 Michał Kalinowski
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software
//  is furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

class KituraRequest {

  #if os(Linux)
  static func request(method: RequestMethod,
                      _ URL: String,
                      parameters: [String: Any]? = nil,
                      encoding: ParameterEncoding = .URL,
                      headers: [String: String]? = nil) -> Request {
  
    let parameters = convertValuesToAnyObject(parameters)
    
    let request =  Request(method: method,
                           URL,
                           parameters: parameters,
                           encoding: encoding,
                           headers: headers)
    request.submit()
    return request
  }
  #else
  static func request(method: RequestMethod,
                      _ URL: String,
                      parameters: [String: AnyObject]? = nil,
                      encoding: ParameterEncoding = .URL,
                      headers: [String: String]? = nil) -> Request {
    
    let request =  Request(method: method,
                           URL,
                           parameters: parameters,
                           encoding: encoding,
                           headers: headers)
    request.submit()
    return request
  }
  #endif
}
