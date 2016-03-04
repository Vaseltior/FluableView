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
//  FluableView : FetchedDataSource.swift
//
//  Created by Samuel Grau on 03/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation
import CoreData

public class GenericDataSource<T: Model>: DataSource {
  public internal(set) var dataModel: T

  override init() {
    self.dataModel = T()
  }
}

public class FetchedDataSource: GenericDataSource<FetchedModel> {
  /**
   Asks the delegate for the height to use for a row in a specified location.
   A nonnegative floating-point value that specifies the height (in points) that `row` should be.

   - parameter tableView: The table-view object requesting this information.
   - parameter indexPath: An index path that locates a row in `tableView`.

   - returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
   */
  public override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    var height = tableView.rowHeight

    if let object = self.dataModel.fetchedResultsController.objectAtIndexPath(indexPath) as? TableCellObject {
      guard let aClass = object.tableCellClass(indexPath) as? TableViewCell.Type else {
        return height
      }

      height = aClass.heightForObject(object, atIndexPath: indexPath, tableView: tableView)
    }

    return height
  }
}
