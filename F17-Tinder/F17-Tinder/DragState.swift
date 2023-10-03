//
//  DragState.swift
//  F17-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 3/10/23.
//

import Foundation

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    
    var translation: CGSize{
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
