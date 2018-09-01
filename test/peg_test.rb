require './test/test_helper.rb'

class PegTest < Minitest::Test

  def test_instance_exists
    peg = Peg.new('A1')

    assert_instance_of Peg, peg
  end

  def test_instance_variables
    peg = Peg.new('A1')

    assert_equal 'A1', peg.guess
  end 

end
