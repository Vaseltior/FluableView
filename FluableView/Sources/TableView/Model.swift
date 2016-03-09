/*
Copyright 2011-present Samuel GRAU

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

//
//  FluableView : NSObjectModel.swift
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
