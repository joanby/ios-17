//
//  DragState.swift
//  F18-AppleWallet
//
//  Created by Juan Gabriel Gomila Salas on 4/10/23.
//

import Foundation

enum DragState {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    
    var index: Int? {
        switch self {
        case .inactive:
            return nil
        case .pressing(let index), .dragging(let index, _):
            return index
        }
    }
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return CGSize()
        case .dragging(_, let translation):
            return translation
        }
    }
    
    var isPressing : Bool{
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .inactive, .pressing:
            return false
        }
    }
    
}
