protocol BaseViewModel {
  associatedtype Action
  
  func action(_ action: Action)
}
