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
//  FluableView : BaseModel+DataLoadable.swift
//
//  Created by Samuel Grau on 02/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation

extension BaseModel: DataLoadable {
  /**
   Tells if the object is loading
   - returns: `true` if the model is loading, whatever is loading method is, otherwise returns `false`.
   */
  public func isLoading() -> Bool {
    return false
  }
  
  /**
   Tells if the object is loaded
   - returns: `true` if the model is loading, whatever is loading method is, otherwise returns `false`.
   */
  public func isLoaded() -> Bool {
    return true
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
   */
  public func cancelLoading() {
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
