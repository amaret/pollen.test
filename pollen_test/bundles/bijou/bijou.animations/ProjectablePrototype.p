

protocol ProjectableProtocol {
  
  enum ProjectableType {Still = 0, Dynamic = 1}

  ProjectableType getTypeOnHost()
  ProjectableType getType()
  setFrame()
}