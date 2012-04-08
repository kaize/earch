class SomeSearcher < Earch::SearcherBase

  document_name :some
  index_name :some_index
  connector Earch.init("localhost", 9200)

  model SomeModel

  mapping do
    field :id, :type => :integer
    field :message, :type => :string
  end

end
