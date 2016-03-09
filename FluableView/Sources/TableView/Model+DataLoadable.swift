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
//  FluableView : BaseModel+DataLoadable.swift
//

import Foundation

extension Model: DataLoadable {
  /**
   Tells if the object is loading
   - returns: `true` if the model is loading, whatever is loading method is, otherwise returns `false`.
   */
  public func isLoading() -> Bool {
    return self.stateFlags.isLoading
  }
  
  /**
   Tells if the object is loaded
   - returns: `true` if the model is loading, whatever is loading method is, otherwise returns `false`.
   */
  public func isLoaded() -> Bool {
    return self.stateFlags.isLoaded
  }
  
  /**
   Indicates that the model is out of date and should be reloaded as soon as possible.
   Default implementation returns `false`.
   
   - returns: `true` if the model is out of date, otherwise returns `false`.
   */
  public func isOutdated() -> Bool {
    return false
  }
  
  /**
   Should the data be reloaded
   Default implementation returns `true`, because any model should be leaded at first
   in order to be used.
   
   - returns: `true` if the model needs to be reloaded, otherwise returns `false`.
   */
  public func shouldLoad() -> Bool {
    return true
  }
  
  /**
   If this is applicable, considering that the loading is asynchronous, will try
   to cancel the request.
   
   - parameter closure: A completion block that offers the user a way to do something
   after the loading is canceled. This makes sense if the cancel operation is asynchronous
   */
  public func cancelLoading(closure: FVVoidClosure? = nil) {
    self.stateFlags.isLoading = false
    self.stateFlags.isLoaded = false
    self.stateFlags.hasContent = false
  }
  
  /**
   Does the model has content
   Default implementation returns `false`, because by default no data is loaded.
   
   - returns: `true` if the model is considered as having content, otherwise returns `false`.
   */
  public func hasContent() -> Bool {
    return false
  }
}
