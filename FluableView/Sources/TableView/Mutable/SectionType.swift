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
//  FluableView : SectionType.swift
//

import Foundation

/**
 The base type of sections contained within a ModelType.
 
 Sections consistent of many elements.
 */
public protocol SectionType: ArrayLiteralConvertible {
  typealias Element
  var elements: [Element] { get }
}
