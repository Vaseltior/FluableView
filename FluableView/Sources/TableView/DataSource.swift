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
//  FluableView : BaseOfNSObjectDataSource.swift
//
//  Created by Samuel Grau on 03/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation
import UIKit

/// 
public class DataSource: NSObject {
  public lazy var dataModel: Model = {
    return Model()
  }()
  
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
    var height = tableView.rowHeight
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
