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

    assert_equal mapping, hash_val_keys_to_sym(true_mapping['some'])
  end

  def test_add_item
    model = SomeModel.new

    SomeSearcher.add_item(model)
    assert true
  end

  #def test_search_term
  #  model = SomeModel.new
  #  SomeSearcher.add_item(model)
  #
  #  item = SomeSearcher.get_item model.id
  #
  #  assert item, model
  #end

  def hash_val_keys_to_sym(h1)
    r = {}
    h1.each do |k,v|
      if v.kind_of? Hash
         r[k.to_sym] = hash_val_keys_to_sym(h1[k])
      else
        r[k.to_sym] = v.to_sym
      end
    end
    r
  end

end
