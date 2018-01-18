//
//  EmitterViewModel.swift
//  ReactNativeExample
//
//  Created by Jonathan Samudio on 11/1/17.
//  Copyright © 2017 Jonathan Samudio. All rights reserved.
//

import React
import Interstellar

private typealias JSON = [String : Any]

@objc(EmitterViewModel)
class EmitterViewModel: RCTEventEmitter {

    private var observables = [String : Observable<Any>]()

    static func loadViewModel<T: EventReceiver>(eventReceivers: [T]) -> EmitterViewModel? {
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        guard let module = delegate?.bridge?.module(for: self) as? EmitterViewModel else {
            return nil
        }
        module.setObservables(eventReceivers: eventReceivers)
        return module
    }
    
    /// Supported events used to send information to JS.
    ///
    /// - Returns: Array of event strings.
    override func supportedEvents() -> [String]! {
        return ApplicationEventProvider.applicationEvents()
    }
    
    /// Requires setup to run on the main queue.
    ///
    /// - Returns: Boolean to determine if it requires a main queue 
    @objc override static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    /// Objective-C function used to receive an event coming from JS.
    ///
    /// - Parameters:
    ///   - event: String identifier coming from JS.
    ///   - data: Data used to update the stored observable with.
    @objc func receivedEvent(_ event: String, data: Any) {
        DispatchQueue.main.async(execute: {
            self.observables[event]?.update(data)
        })
    }
    
    /// Observes an event coming from JS.
    ///
    /// - Parameter eventReceiver: Receiver type coming from JS.
    /// - Returns: Optional Observable for the givent receiver.
    func observe<T: EventReceiver>(eventReceiver: T) -> Observable<Any>? {
        return observables[eventReceiver.rawValue]
    }

    func subscribe<T: EventReceiver, U: Decodable>(eventReceiver: T, handler: @escaping (U)->()) {
        observables[eventReceiver.rawValue]?.subscribe({ (data) in
            if let data = data as? U {
                handler(data)
            }

            // Parse out for networking
            if let json = data as? JSON {
                self.handleNetworkUpdate(json: json, handler: handler)
            }

            if let jsonArray = data as? [JSON] {
                self.handleArrayNetworkUpdate(json: jsonArray, handler: handler)
            }
        })
    }

    /// Invokes an event with the given parameters.
    ///
    /// - Parameters:
    ///   - event: Event to send to JS.
    ///   - data: Additional data to send to JS.
    func invoke<T: EventSender>(event: T, data: Any = "") {
        addListener(event.rawValue)
        sendEvent(withName: event.rawValue, body: data)
    }
}

private extension EmitterViewModel {

    private func setObservables<T: EventReceiver>(eventReceivers: [T]) {
        observables = [String : Observable<Any>]()
        eventReceivers.forEach {
            observables[$0.rawValue] = Observable<Any>()
        }
    }

    private func handleNetworkUpdate<U: Decodable>(json: JSON, handler: @escaping (U)->()) {
        let decoder = JSONDecoder()

        do {
            let data = try JSONSerialization.data(withJSONObject: json)
            let model = try decoder.decode(U.self, from: data)
            handler(model)
        } catch {
            // TODO: Handle network error
        }
    }

    private func handleArrayNetworkUpdate<U: Decodable>(json: [JSON], handler: @escaping (U)->()) {
        let decoder = JSONDecoder()

        do {
            let data = try JSONSerialization.data(withJSONObject: json)
            let model = try decoder.decode(U.self, from: data)
            handler(model)
        } catch {
            // TODO: Handle network error
        }
    }
}





