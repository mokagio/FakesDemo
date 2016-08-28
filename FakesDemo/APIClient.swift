//
//  APIAction.swift
//  FakesDemo
//
//  Created by Giovanni on 29/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

enum APIError: ErrorType {
  case Unauthenticated
  case WrappedError(NSError)
}

class APIClient {

  let credentialsStorage: CredentialsStorage
  let baseURL: NSURL
  let session: NSURLSession

  init(baseURL: NSURL, credentialsStorage: CredentialsStorage) {
    self.baseURL = baseURL
    self.credentialsStorage = credentialsStorage
    self.session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  }

  func login(username: String, password: String, callback: (Result<APIToken, APIError>) -> ()) {
    // TODO: Config proper request
    let request = NSURLRequest(URL: baseURL.URLByAppendingPathComponent("login"))

    let task = session.dataTaskWithRequest(request) { data, response, error in
      if let error = error {
        callback(Result(error: .WrappedError(error)))
      } else {
        // TODO: Inspect content etc...
        let token = "ABCD-1234"

        callback(Result(value: token))
      }
    }

    task.resume()
  }

  func getResource(id: String, callback: (Result<Resource, APIError>) -> ()) {
    // TODO: Config proper request
    let request = NSURLRequest(URL: baseURL.URLByAppendingPathComponent("resource/\(id)"))

    let task = session.dataTaskWithRequest(request) { data, response, error in
      if let error = error {
        callback(Result(error: .WrappedError(error)))
      } else {
        // TODO: Inspect content etc...
        callback(Result(value: Resource(property: "")))
      }
    }

    task.resume()
  }
}
