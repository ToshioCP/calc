require 'minitest/autorun'
require 'fileutils'
include FileUtils
require_relative 'lib_calc.rb'

class TestCalc < Minitest::Test
  def setup
    @calc = Calc.new
  end
  def teardown
  end

  def test_lex
    "sin|cos|tan|asin|acos|atan|exp|log".split("|").each do |func|
      assert_equal [[func.to_sym,nil],[:'(',nil],[:id,"x"],[:')',nil]], @calc.lex("#{func}(x)")
      assert_equal [[:'(',nil],[:'-',nil],[:num,2.0],[:'+',nil],[:id,"abc"],[:')',nil],[:'*',nil],[:'(',nil],[:num,1.2],[:'+',nil],[:id,"def"],[:')',nil]], @calc.lex("(-2+abc)*(1.2+def)")
      assert_equal [[:id,"a"],[:'=',nil],[:num,100.0]], @calc.lex("a = 100")
      assert_equal [[:store,nil],[:id,"var"]], @calc.lex("store var")
      assert_equal [[:PI,nil],[:E,nil]], @calc.lex("PI E")
      assert_equal [[:num,1],[:';',nil],[:num,2]], @calc.lex("1;2")
    end
  end

  # test parse with lex
  def test_parse
    assert_output("100\n"){@calc.run("10*10")}
    assert_output("-6\n"){@calc.run("-2*3")}
    assert_output("15\n"){@calc.run("(2+3)*(5-2)")}
    assert_output("1.56\n"){@calc.run("1.2*1.3")}
    assert_output("30\n"){@calc.run("x=10;x+20")}
    assert_output("5\n25\n"){@calc.run("5;store yy;yy*yy")}
    assert_output("3.141592653589793\n"){@calc.run("PI")}
    assert_output("2.718281828459045\n"){@calc.run("E")}
    assert_output("1\n"){@calc.run("sin(PI/2)")}
    assert_output("1\n"){@calc.run("log(E)")}
    assert_output("1.4142135623730951\n"){@calc.run("sqrt(2)")}
  end
end
