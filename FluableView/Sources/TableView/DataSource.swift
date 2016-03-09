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
//  FluableView : BaseOfNSObjectDataSource.swift
//

import Foundation
import UIKit

/// 
public class DataSource: NSObject {
  /// A weak reference to a controller object... This need not to be a UIViewController
  public weak var controllerDelegate: AnyObject? = nil
  
  public override init() {
    super.init()
  }
  
}

extension DataSource: UITableViewDelegate {
  /**
   Asks the delegate for the height to use for a row in a specified location.
   A nonnegative floating-point value that specifies the height (in points) that `row` should be.
   
   - parameter tableView: The table-view object requesting this information.
   - parameter indexPath: An index path that locates a row in `tableView`.
   
   - returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
   */
  public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let height = tableView.rowHeight
    /*
    if let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as? SFTableCellObject {
    let aClass = object.tableCellClass(indexPath)
    let fH = aClass.sfHeight(object, indexPath:indexPath, tableView:tableView)
    height = fH
    
    }*/
    
    return height
  }
  
  /**
   Tells the delegate that the specified row is now selected.
   The delegate handles selections in this method. One of the things it can do is exclusively
   assign the check-mark image (UITableViewCellAccessoryCheckmark) to one row in a section (radio-list style).
   This method isn’t called when the editing property of the table is set to true
   (that is, the table view is in editing mode). See "Managing Selections" in Table View Programming Guide
   for iOS for further information (and code examples) related to this method.
   
   - parameter tableView: A table-view object informing the delegate about the new row selection.
   - parameter indexPath: An index path locating the new selected row in `tableView`.
   */
  public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}

extension DataSource: TableViewModelDelegate {
  /**
   Fetches a table view cell at a given index path with a given object.
   The implementation of this method will generally use object to customize the cell.
   
   - parameter tableViewModel: the model
   - parameter tableView:      the table view
   - parameter indexPath:      the location of the cell in the tableview
   - parameter object:         the object
   
   - throws: this method can throw error when the table view is not yet registered or if the involved
   table view cells are not `TableViewCell`
   
   - returns: A table view cell object
   */
  public func tableViewModel(
    tableViewModel: Model,
    cellForTableView tableView: UITableView,
    atIndexPath indexPath: NSIndexPath,
    withObject object: TableCellObject) throws -> TableViewCell {
      
      // The model gives us the object
      return try TableCellFactory.sharedInstance.tableViewModel(
        tableViewModel,
        cellForTableView:tableView,
        atIndexPath:indexPath,
        withObject:object
      )
  }
}
