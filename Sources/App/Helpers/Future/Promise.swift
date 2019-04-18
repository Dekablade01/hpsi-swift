//
//  Promise.swift
//  App
//
//  Created by Issarapong Poesua on 17/4/19.
//

import Foundation

final class Promise<T> {
    
    var result: Result<T, Error>? {
        didSet { result.map(report) }
    }
    
    private lazy var callbacks = [(Result<T, Error>) -> Void]()
    
    init(value: T? = nil) {
        if let value = value { result = .success(value) }
    }
    
    func observe(with callback: @escaping (Result<T, Error>) -> Void) {
        callbacks.append(callback)
        result.map(callback)
    }
    
    func success(with value: T) {
        result = .success(value)
    }
    
    func failure(with error: Error) {
        result = .failure(error)
    }
    
    private func report(result: Result<T, Error>) {
        for callback in callbacks { callback(result) }
    }
    
}

