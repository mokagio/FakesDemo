//
//  FakesDemoTests.swift
//  FakesDemoTests
//
//  Created by Giovanni on 29/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import XCTest
@testable import FakesDemo

class FakesDemoTests: XCTestCase {

  // When performing a successful the login
  // It stores the token returned by the server in the credentials storage
  func testLoginStoresToken() {
    let credentialsStorage = FakeCredentialsStorage()
    credentialsStorage.token = .None
    let url = NSURL(string: "http://localhost:4567")!
    let sut = APIClient(baseURL: url, credentialsStorage: credentialsStorage)

    let expectation = expectationWithDescription("sets token")

    sut.login("johndooe", password: "password") { result in
      XCTAssertEqual(credentialsStorage.token, "ABCD-1234")
      expectation.fulfill()
    }

    waitForExpectationsWithTimeout(1, handler: .None)
  }

  // When performing a get resource request,
  // When there is no token in the storage
  // It executes the callback with an "Unauthenticated" error
  func testUnauthenticatedGetResource() {
    let credentialsStorage = FakeCredentialsStorage()
    credentialsStorage.token = .None
    let url = NSURL(string: "http://localhost:4567")!
    let sut = APIClient(baseURL: url, credentialsStorage: credentialsStorage)

    let expectation = expectationWithDescription("gets unauthenticated error")

    sut.getResource("123A") { result in
      switch result {
      case .Success(_): XCTFail("Expected callback be a failure, got a success")
      case .Failure(let error):
        switch error {
        case .Unauthenticated: break // all good ;)
        case _: XCTFail("Expected error to be .Unauthenticated, got \"\(error)\"")
        }
      }
      expectation.fulfill()
    }

    waitForExpectationsWithTimeout(1, handler: .None)
  }
}

class FakeCredentialsStorage: CredentialsStorage {

  var token: APIToken?

  func setToken(token: APIToken) {
    self.token = token
  }
}
