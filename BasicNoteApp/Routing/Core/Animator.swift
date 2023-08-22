//
//  Animator.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 20.08.2023.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
