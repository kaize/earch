require 'test_helper'

class SearcherTest < MiniTest::Unit::TestCase

  def setup
    #@earch = Earch.init("localhost", 9200)
    #@earch.create("some_index", "some", {
      #:some => {:properties => {
        #:id => {:type => :integer}
      #}}
    #}.to_json)

    SomeSearcher.create_document
    SomeSearcher.put_mapping
  end

  def test_hash_builder
    hash = SomeSearcher.build_hash do
      filter do
        term :id, 3 #, {:_cache => false}
      end
    end

    true_hash = {
      :filter => {
        :term => {
          :id => 3
        }
      }
    }

    assert_equal hash, true_hash
  end

  def test_mapping
    mapping = SomeSearcher.mapping.to_hash

    earch = Earch.init("localhost", 9200)
    true_mapping = earch.get_mapping(SomeSearcher.index_name, SomeSearcher.document_name)

    #TODO!!!!
    assert_equal mapping, true_mapping
  end

  def test_query_result
    model = SomeModel.new

  end

end
