require 'test_helper'
require 'some_searcher'

class SearcherTest < MiniTest::Unit::TestCase

  def setup
    @earch = Earch.init("localhost", 9200)
    @earch.create("some_index", "some", {
      :some => {:properties => {
        :id => {:type => :integer}
      }}
    }.to_json)
  end

  def test_bla_bla
    assert true

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

end
