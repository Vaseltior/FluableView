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

import Foundation
import UIKit
import CoreData

// MARK: - NSFetchedResultsControllerDelegate

extension FetchedModel: NSFetchedResultsControllerDelegate {
  
  /**
   Notifies the receiver that the fetched results controller is about to start processing of 
   one or more changes due to an add, remove, move, or update.
   
   - parameter controller: The fetched results controller that sent the message.
   */
  public func controllerWillChangeContent(controller: NSFetchedResultsController) {
    // Simply returning because we can't tell the nil table view to do something
    guard let tableView = self.tableView else { return }
    // Ask for bunch of updates
    tableView.beginUpdates()
  }
  
  /**
   Notifies the receiver that the fetched results controller has completed processing of 
   one or more changes due to an add, remove, move, or update.
   
   - parameter controller: The fetched results controller that sent the message.
   */
  public func controllerDidChangeContent(controller: NSFetchedResultsController) {
    // Simply returning because we can't tell the nil table view to do something
    guard let tableView = self.tableView else { return }
    // Ask for bunch of updates
    tableView.endUpdates()
  }
  
  /**
   Notifies the receiver that a fetched object has been changed due to an add, remove, move, or update.
   
   - parameter controller:   The fetched results controller that sent the message.
   - parameter anObject:     The object in controller’s fetched results that changed.
   - parameter indexPath:    The index path of the changed object (this value is `nil` for insertions).
   - parameter type:         The type of change. For valid values see NSFetchedResultsChangeType.
   - parameter newIndexPath: The destination path for the object for insertions or moves (this value is `nil` for a deletion).
   */
  public func controller(
    controller: NSFetchedResultsController,
    didChangeObject anObject: AnyObject,
    atIndexPath indexPath: NSIndexPath?,
    forChangeType type: NSFetchedResultsChangeType,
    newIndexPath: NSIndexPath?) {
      
      // Simply returning because we can't tell the nil table view to do something
      guard let tableView = self.tableView else { return }
      
      // Considering the described change, act accordingly
      switch type {
      case NSFetchedResultsChangeType.Insert: self.insertRow(indexPath: newIndexPath, tableView: tableView)
      case NSFetchedResultsChangeType.Delete: self.deleteRow(indexPath: indexPath, tableView: tableView)
      case NSFetchedResultsChangeType.Move: self.moveRow(fromIndexPath: indexPath, toIndexPath:newIndexPath, tableView: tableView)
      case NSFetchedResultsChangeType.Update: self.updateRow(controller, indexPath: indexPath, tableView: tableView)
      }
  }
  
  // MARK: - Private
  
  /**
  Inserts the `row`
  
  - parameter newIndexPath: The destination path for the object for insertions or moves
  - parameter tableView:    The table view in which the operation should occur
  */
  private func insertRow(indexPath newIndexPath: NSIndexPath?, tableView: UITableView) {
    guard let destinationPath = newIndexPath else { return }
    tableView.insertRowsAtIndexPaths([destinationPath], withRowAnimation: UITableViewRowAnimation.Automatic)
  }
  
  /**
   Deletes the `row`
   
   - parameter indexPath: The index path of the changed object
   - parameter tableView: The table view in which the operation should occur
   */
  private func deleteRow(indexPath indexPath: NSIndexPath?, tableView: UITableView) {
    guard let modifiedPath = indexPath else { return }
    tableView.deleteRowsAtIndexPaths([modifiedPath], withRowAnimation: UITableViewRowAnimation.Automatic)
  }
  
  /**
   Moves the `row`
   
   - parameter indexPath:    The index path of the changed object
   - parameter newIndexPath: The destination path for the object for moves
   - parameter tableView:    The table view in which the operation should occur
   */
  private func moveRow(fromIndexPath indexPath: NSIndexPath?, toIndexPath newIndexPath: NSIndexPath?, tableView: UITableView) {
    guard let modifiedPath = indexPath else { return }
    tableView.deleteRowsAtIndexPaths([modifiedPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    guard let destinationPath = newIndexPath else { return }
    tableView.insertRowsAtIndexPaths([destinationPath], withRowAnimation: UITableViewRowAnimation.Automatic)
  }
  
  /**
   Updates the `row`
   
   - parameter controller: The fetched results controller that sent the message.
   - parameter indexPath:  The index path of the changed object
   - parameter tableView:  The table view in which the operation should occur
   */
  private func updateRow(controller: NSFetchedResultsController, indexPath: NSIndexPath?, tableView: UITableView) {
    // Provide the object to the cell
    guard let modifiedPath = indexPath else { return }
    guard let cell = tableView.cellForRowAtIndexPath(modifiedPath) as? UpdatableTableViewCell else { return }
    guard let object = controller.objectAtIndexPath(modifiedPath) as? TableCellObject else { return }
    if cell.shouldUpdateCellWithObject(object, indexPath: modifiedPath) {
      cell.updateCellWithObject(object, indexPath: modifiedPath)
    }
  }
}
