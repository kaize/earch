require 'test_helper'

class MappingTest < MiniTest::Unit::TestCase

  def setup
  end

  def test_json_is_valid
    result_mapping = Earch::MappingBuilder.build do
      field :id, :type => :integer
      field :message, :questions, :type => :string
    end.to_json

    true_mapping = {
      :properties => {
        :id => { :type => :integer },
        :message => { :type => :string }
      }
    }.to_json

    assert_equal result_mapping, true_mapping
  end

  def test_nested_json_is_valid
    result_mapping = Earch::MappingBuilder.build do
      field :id, :type => :integer
      field :message, :type => :nested do
        field :id, :type => :integer
      end
    end.to_json

    true_mapping = {
      :properties => {
        :id => { :type => :integer },
        :message => { :type => :nested, :properties => {
            :id => {:type => :integer}
          }
        }
      }
    }.to_json

    assert_equal result_mapping, true_mapping
  end
end



