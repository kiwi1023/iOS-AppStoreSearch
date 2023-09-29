//
//  ViewModelProtocol.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI
import Combine

protocol ViewModelProtocol: ObservableObject {
  associatedtype Action
  
  func action(_ action: Action)
}
