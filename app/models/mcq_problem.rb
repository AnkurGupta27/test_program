class McqProblem < Problem

  self.inheritance_column = "type"
  has_many :options

  # attr_accessible :title, :body
end
