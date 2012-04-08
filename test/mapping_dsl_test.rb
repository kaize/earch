require 'test_helper'

class MappingDslTest < MiniTest::Unit::TestCase

  def setup

    @m = Earch::Mapping.build :name do
      field :name, :string
      field :id, :integer
      field :created_at, :date

      #string :name
      #integer :id
      #date :created_at
    end

  end

  def test_create
    assert @m
  end

  def test_hash_is_valid
    assert @m[:name]
    assert @m[:name][:properties]
    assert @m[:name][:properties][:name]
    assert_equal @m[:name][:properties][:name][:type], :string
  end
end



