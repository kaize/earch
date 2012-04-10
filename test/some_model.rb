class SomeModel

  @@id = 0
  @@repository = {}

  def initialize
    @@id += 1
    @id = @@id
    @@repository[@id] = self
  end

  def id
    @id
  end

  def message
    "message-#{id}"
  end

  def self.find(id)
    @@repository[id]
  end

end
