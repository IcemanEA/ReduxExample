//
//  Types.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 18.05.2024.
//

typealias Closure = () -> ()
typealias ClosureWith<T> = (T) -> ()

func none() {}
func none<T>(_ value: T) {}
