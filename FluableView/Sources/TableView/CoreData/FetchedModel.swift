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
//  FluableView : FetchedModel.swift
//
//  Created by Samuel Grau on 03/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation
import CoreData

public class FetchedModel: Model {
  
  // MARK: Properties
  
  /// The fetched result controller in charge of handling data fetch from CoreData
  public var fetchedResultsController: NSFetchedResultsController! = nil
  
  // MARK: Private
  
  private func performFetch() throws {
    // Perform Fetch
    // NSFetchedResultsController.deleteCacheWithName(nil)
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
