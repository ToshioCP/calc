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
    assert_equal 7, @calc.run("1+2*3")
    assert_equal 12.5, @calc.run("3*5-5/2")
    assert_equal 100, @calc.run("10*10")
    assert_equal -6, @calc.run("-2*3")
    assert_equal 15, @calc.run("(2+3)*(5-2)")
    assert_equal 1.56, @calc.run("1.2*1.3")
    assert_equal 256, @calc.run("2**2**3")
    assert_equal 30, (@calc.run("x=10");@calc.run("x+20"))
    assert_equal 3.141592653589793, @calc.run("PI")
    assert_equal 2.718281828459045, @calc.run("E")
    assert_equal 1, @calc.run("sin(PI/2)")
    assert_equal 0.5, @calc.run("round(cos(PI/3),10)") # the result of cos includes error.
    assert_equal 1, @calc.run("round(tan(PI/4),10)") # the result of tan includes error.
    assert_equal (Math::PI/6).round(10), @calc.run("round(asin(1/2),10)")
    assert_equal (Math::PI/3).round(10), @calc.run("round(acos(1/2),10)")
    assert_equal (Math::PI/3).round(10), @calc.run("round(atan(sqrt(3)),10)")
    assert_equal (Math::PI/3).round(10), @calc.run("round(atan(sqrt(3)),10)")
    assert_equal (Math::E**2).round(10), @calc.run("round(exp(2),10)")
    assert_equal 1, @calc.run("ln(E)")
    assert_equal 3, @calc.run("log(1000)")
    assert_equal 1.4142135623730951, @calc.run("sqrt(2)")
    assert_equal 100, (@calc.run("20");@calc.run("v*5"))
    assert_equal -1, @calc.run("1+-2")  # If 1+-2 is not allowed, assert_raises(ParseError) {@calc.run("1+-2")}
    assert_equal -1, @calc.run("1+(-2)")
    assert_equal 12.3, @calc.run("abs(-12.3)")
    assert_equal 120, @calc.run("fact(5)")
    assert_equal 12, @calc.run("floor(12.345)")
    assert_equal 13, @calc.run("ceil(12.345)")
    assert_equal 12.35, @calc.run("round(12.345,2)")
  end
end
