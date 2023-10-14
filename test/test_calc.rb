require 'minitest/autorun'
require 'calc'

class TestCalc < Minitest::Test
  def setup
    @calc = Calc.new
  end
  def teardown
  end

  def test_calc
    assert_equal 3, @calc.run("1+2")
    assert_equal 100, @calc.run("10*10")
    assert_equal -6, @calc.run("-2*3")
    assert_equal 15, @calc.run("(2+3)*(5-2)")
    assert_equal 1.56, @calc.run("1.2*1.3")
    assert_equal 256, @calc.run("2**2**3")
    assert_equal 30, (@calc.run("x=10");@calc.run("x+20"))
    assert_equal 3.141592653589793, @calc.run("PI")
    assert_equal 2.718281828459045, @calc.run("E")
    assert_equal 1, @calc.run("sin(PI/2)")
    assert_equal 1, @calc.run("log(E)")
    assert_equal 1.4142135623730951, @calc.run("sqrt(2)")
    assert_equal 100, (@calc.run("20");@calc.run("v*5"))
    assert_raises(ParseError) {@calc.run("1+-2")}
  end
end
