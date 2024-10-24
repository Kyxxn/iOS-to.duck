//
//  DIContainer.swift
//  TDCore
//
//  Created by 박효준 on 10/21/24.
//

import Swinject

public protocol DependencyAssemblable {
    func assemble(_ assemblyList: [Assembly])
    func register<Service>(_ serviceType: Service.Type, _ object: Service)
    func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service)
}

public protocol DependencyResolvable {
    func resolve<Service>(_ serviceType: Service.Type) -> Service
}

public typealias DependencyInjectable = DependencyAssemblable & DependencyResolvable

public final class DIContainer: DependencyInjectable {
    public static var shared: DIContainer = DIContainer()
    private var container: Container = Container()
    
    private init() { }
    
    public func assemble(_ assemblyList: [Assembly]) {
        for assembly in assemblyList {
            assembly.assemble(container: container)
        }
    }
    
    public func register<Service>(_ serviceType: Service.Type, _ object: Service) {
        container.register(serviceType) { _ in object }
    }
    
    public func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) {
        container.register(serviceType, factory: factory)
    }
    
    public func resolve<Service>(_ serviceType: Service.Type) -> Service {
        print("")
        guard let service = container.resolve(serviceType) else {
            fatalError("\(serviceType)를 Resolve 실패함")
        }
        return service
    }
}
