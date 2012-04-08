class SomeSearcher < Earch::SearcherBase

  document_name :some
  index_name :some_index
  adapter Earch.init("localhost", 9200).adapter

  #model SomeModel

  mapping do
    {}
  end

end
