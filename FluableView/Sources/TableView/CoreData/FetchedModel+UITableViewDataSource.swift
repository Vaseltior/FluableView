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
//  FluableView : FetchedModel+UITableViewDataSource.swift
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
    var cell: UITableViewCell? = nil
    if let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as? TableCellObject {
      do {
        cell = try self.delegate?.tableViewModel(self, cellForTableView:tableView, atIndexPath:indexPath, withObject:object)
      } catch let error {
        
        fatalError("Could not create the table view cell: \(error)")
      }
    }
    
    return cell!
  }
}
