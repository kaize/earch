require 'test_helper'

class MappingDsl < MiniTest::Unit::TestCase

  def setup

    @m = Earch::Mapping.build :name do
      string :name
      integer :id
      date :create_at
    end

  end

  def test_create_test

  end

end



