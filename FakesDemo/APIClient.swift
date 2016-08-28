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
    fatalError()
  }

  func getResource(id: String, callback: (Result<Resource, APIError>) -> ()) {
    fatalError()
  }
}
