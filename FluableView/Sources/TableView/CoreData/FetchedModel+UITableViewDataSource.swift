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
//  FluableView : FetchedModel+UITableViewDataSource.swift
//
//  Created by Samuel Grau on 03/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation
import CoreData

// MARK: - UITableViewDataSource

extension FetchedModel: UITableViewDataSource {
  
  /**
   Asks the data source to return the number of sections in the table view.
   
   - parameter tableView: An object representing the table view requesting this information.
   
   - returns: The number of sections in `tableView`. The default value is 1.
   */
  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    guard let sections = self.fetchedResultsController.sections else { return 1 }
    return sections.count
  }
  
  /**
   Tells the data source to return the number of rows in a given section of a table view.
   
   - parameter tableView: The table-view object requesting this information.
   - parameter section:   An index number identifying a section in tableView.
   
   - returns: The number of rows in `section`.
   */
  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = self.fetchedResultsController.sections else { return 0 }
    assert(section < sections.count, "Ready to out of bounds")
    // Getting the number of objects of the NSFetchedResultsSectionInfo
    return sections[section].numberOfObjects
  }
  
  /**
   Asks the data source for a cell to insert in a particular location of the table view.
   
   - parameter tableView: A table-view object requesting the cell.
   - parameter indexPath: An index path locating a row in `tableView`.
   
   - returns: An object inheriting from `UITableViewCell` that the table view can use for the specified row. 
   An assertion is raised if you return `nil`.
   */
  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //Swell.debug { "Table view asking cell for row at " + indexPath.description }
    
    var cell: UITableViewCell? = nil
    if let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as? TableCellObject {
      IMPLEMENTME()
      /*cell = self.cell(
      object.tableCellClass(indexPath),
      tableView: tableView,
      indexPath: indexPath,
      object: object
      )*/
      
      if nil == cell {
        fatalError("Could not create the table view cell")
      }
    }
    
    return cell!
  }
}
