//
// The MIT License (MIT)
//
// Copyright (c) 2015 Samuel GRAU
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

//
//  FluableView : NSObjectModel.swift
//
//  Created by Samuel Grau on 03/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation
import UIKit

public class Model: NSObject, Modelizable {
  public var delegate: TableViewModelDelegate? = nil
  
  public required override init() {
    super.init()
  }
  
  deinit {
    self.delegate = nil
  }
  
  /// A set of flags that can maintain information about different states
  public struct StateFlags {
    var isLoading: Bool
    var isLoaded: Bool
    var hasContent: Bool
    var hasNoMore: Bool
    var isCancelled: Bool
  }
  
  // MARK: - Properties -
  
  /// The state flags of the base model
  public var stateFlags: Model.StateFlags = Model.StateFlags(
    isLoading: false,
    isLoaded: false,
    hasContent: false,
    hasNoMore: false,
    isCancelled: false
  )
  
  /// Maintains information about the last error occured in the model, if any
  public internal(set) var lastError: FVError? = nil
  
  /// Maintains information about the last update date of the model
  public private(set) var lastUpdate: FVDate? = nil
  
  /// A weak pointer to the table view involved
  public weak var tableView: UITableView? = nil
  
  // MARK: - Initialization -
  
  // MARK: - Compilation -
  
  public func compileData() {
  }
  
  public func compileDataModel() throws {
    self.compileData()
  }
  
  public func compileDataModelWitCompletion(closure: FVVoidClosure?) {
    if self.isLoading() {
      //self.cancelRequest()
    }
    
    self.stateFlags.hasContent = false
    self.stateFlags.isLoaded = false
    self.stateFlags.isLoading = true
    
    do {
      try self.compileDataModel()
      
      self.lastUpdate = NSDate()
      self.lastError = nil
      self.stateFlags.isLoaded = true
      self.stateFlags.isLoading = false
      //self.stateFlags.hasContent = self.numberOfResults() != 0
      
    } catch let error {
      self.stateFlags.hasContent = false
      self.stateFlags.isLoaded = true
      self.stateFlags.isLoading = false
      self.lastError = error
      
    }
    
    closure?()
  }
}
