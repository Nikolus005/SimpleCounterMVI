//
//  CounterReactor.swift
//  MviDemo
//
//  Created by Dogether on 25/04/18.
//  Copyright © 2018 Dogether. All rights reserved.
//

import ReactorKit
import RxSwift

class CounterReactor: Reactor {
    enum Action {
        case increament
    }
    
    enum Mutation {
        case increamentValue
    }
    
    struct State {
        
        var value:UInt8 = 0
    }
    
    var initialState: State
    
    init() {
        self.initialState = State(value: 0)
    }
    init(number:UInt8) {
        self.initialState = State(value: number)
    }
    
    func mutate(action: CounterReactor.Action) -> Observable<CounterReactor.Mutation> {
        switch action {
        case .increament:
            return Observable.just(Mutation.increamentValue)
        default:
            break
        }
    }
    func reduce(state: CounterReactor.State, mutation: CounterReactor.Mutation) -> CounterReactor.State {
        var state = state
        switch mutation {
        case .increamentValue:
            state.value += 1
        default:
            break
        }
        return state
    }
}
