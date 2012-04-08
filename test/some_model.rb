class SomeModel
  @@id = 0
  def initialize
    @@id += 1
    @id = @@id
  end

  def id
    @id
  end

  def message
    "message-#{id}"
  end
end
