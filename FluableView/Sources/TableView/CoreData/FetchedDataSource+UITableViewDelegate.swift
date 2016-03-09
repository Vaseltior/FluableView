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
//  FluableView : FetchedDataSource+UITableViewDelegate.swift
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate

extension FetchedDataSource {
  /**
  Asks the delegate for the height to use for a row in a specified location.
  A nonnegative floating-point value that specifies the height (in points) that `row` should be.
  
  - parameter tableView: The table-view object requesting this information.
  - parameter indexPath: An index path that locates a row in `tableView`.
  
  - returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
  */
  /*public override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
  var height = tableView.rowHeight
  
  if let object = self.dataModel.fetchedResultsController.objectAtIndexPath(indexPath) as? TableCellObject {
  guard let aClass = object.tableCellClass(indexPath) as? TableViewCell.Type else {
  return height
  }
  
  height = aClass.heightForObject(object, atIndexPath: indexPath, tableView: tableView)
  }
  
  return height
  }*/
  
}
