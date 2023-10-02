//
//  DragState.swift
//  F15-Gestos
//
//  Created by Juan Gabriel Gomila Salas on 2/10/23.
//

import Foundation

enum DragState{
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self{
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isTapped: Bool{
        switch self{
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
