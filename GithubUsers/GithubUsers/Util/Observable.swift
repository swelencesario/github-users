//
//  Observable.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 15/09/24.
//

import Foundation

public protocol ObservableProtocol: AnyObject {
    func unbind()
}

public class Observable<T>: ObservableProtocol {
    public typealias Listener = (T) -> Void
    private var listener: Listener?
    public var isBinded: Bool { return listener != nil }

    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(self.value)
    }

    public func bindWithoutFire(listener: Listener?) {
        self.listener = listener
    }

    public func unbind() {
        listener = nil
    }

    public var value: T {
        didSet {
            self.listener?(self.value)
        }
    }

    public init(_ v: T) {
        value = v
    }
}
