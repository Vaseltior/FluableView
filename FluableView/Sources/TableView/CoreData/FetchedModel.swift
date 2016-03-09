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
//  FluableView : FetchedModel.swift
//

import Foundation
import CoreData

public class FetchedModel: Model {
  
  // MARK: Properties
  
  /// The fetched result controller in charge of handling data fetch from CoreData
  public var fetchedResultsController: NSFetchedResultsController! = nil
  
  // MARK: Private
  
  public func performFetch() throws {
    // Perform Fetch
    //NSFetchedResultsController.deleteCacheWithName(nil)
    try self.fetchedResultsController.performFetch()
  }
  
  // MARK: - Compilation -
  
  /**
  Compiles the data of the fetched result controller
  */
  public override func compileData() {
    do {
      try self.performFetch()
      
    } catch let error {
      self.lastError = error
    }
  }
  
  /**
   Returns the object at the wanted indexPath
   
   - parameter indexPath: the index path used to look up the object
   
   - returns: the object at the given index path
   */
  public func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
    return self.fetchedResultsController.objectAtIndexPath(indexPath)
  }
}
