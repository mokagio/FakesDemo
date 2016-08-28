//
//  Result.swift
//  FakesDemo
//
//  Created by Giovanni on 29/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

enum Result<T, ErrorType> {
  case Success(T)
  case Failure(ErrorType)

  init(value: T) {
    self = .Success(value)
  }

  init(error: ErrorType) {
    self = .Failure(error)
  }
}
