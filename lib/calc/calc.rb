#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.6.2
# from Racc grammar file "".
#

require 'racc/parser.rb'


require 'strscan'
include Math

class Calc < Racc::Parser

module_eval(<<'...end calc.y/module_eval...', 'calc.y', 50)
 
def initialize
  @table = {}
end

def run(s)
  @tokens = []
  lex(s)
  do_parse
end

alias parse run

private

def lex(s)
  ss = StringScanner.new(s)
  until ss.eos?
    if ss.scan(/sqrt|sin|cos|tan|asin|acos|atan|exp|ln|log|abs|fact|floor|ceil|round|PI|E|v/)
      @tokens << [ss[0].to_sym, ss[0]]
    elsif ss.scan(/[[:alpha:]]+/)
      @tokens << [:ID, ss[0]]
    elsif ss.scan(/[[:digit:]]+(\.[[:digit:]]*)?/)
      @tokens << [:NUM, ss[0].to_f]
    elsif ss.scan(/\*\*/)
      @tokens << [:POWER,ss[0]]
    elsif ss.scan(/[+\-*\/()=;,]/)
      @tokens << [ss[0],ss[0]]
    elsif ss.scan(/\s+/)
      # ignore spaces
    else
      raise "Unexpected character."
    end
  end
  @tokens << [false, nil] # end mark
end

def next_token
  @tokens.shift
end

def fact(f)
  n = f.to_i
  raise ("No factorial for negative number.") if n < 0
  raise ("The argument of fact must be less than 171.") if n >= 171
  if n == 0 || n == 1
    1.0
  else
    (1..n).inject{|result, item| result*item}.to_f
  end
end

...end calc.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    29,    30,    27,    28,    29,    30,    27,    28,    29,    30,
    27,    28,    29,    30,    27,    28,    29,    30,    27,    28,
    29,    30,    27,    28,    29,    30,    26,    88,    29,    30,
    58,    31,    34,    36,    74,    37,    38,    39,    75,    40,
    41,    42,    76,    43,    44,    45,    77,    29,    30,    27,
    28,    29,    30,    27,    28,    29,    30,    27,    28,    29,
    30,    27,    28,    29,    30,    27,    28,    29,    30,    27,
    28,    46,    47,    78,    48,    49,    50,    79,    51,    34,
    34,    80,   nil,   nil,   nil,    81,   nil,   nil,   nil,    82,
   nil,   nil,   nil,    83,    29,    30,    27,    28,    29,    30,
    27,    28,    29,    30,    27,    28,    29,    30,    27,    28,
    29,    30,    27,    28,    29,    30,    27,    28,   nil,   nil,
    84,   nil,   nil,   nil,    85,   nil,   nil,   nil,    86,   nil,
   nil,   nil,    87,   nil,   nil,   nil,    90,     4,     3,     7,
     8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
    18,    19,    20,    21,    22,    23,    24,    25,   nil,     6,
     4,    33,     7,     8,     9,    10,    11,    12,    13,    14,
    15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
    25,   nil,     6,     4,    33,     7,     8,     9,    10,    11,
    12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
    22,    23,    24,    25,   nil,     6,     4,    33,     7,     8,
     9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
    19,    20,    21,    22,    23,    24,    25,   nil,     6,     4,
    33,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
   nil,     6,     4,    33,     7,     8,     9,    10,    11,    12,
    13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
    23,    24,    25,   nil,     6,     4,    33,     7,     8,     9,
    10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
    20,    21,    22,    23,    24,    25,   nil,     6,     4,    33,
     7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
    17,    18,    19,    20,    21,    22,    23,    24,    25,   nil,
     6,     4,    33,     7,     8,     9,    10,    11,    12,    13,
    14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
    24,    25,   nil,     6,     4,    33,     7,     8,     9,    10,
    11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
    21,    22,    23,    24,    25,   nil,     6,     4,    33,     7,
     8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
    18,    19,    20,    21,    22,    23,    24,    25,   nil,     6,
     4,    33,     7,     8,     9,    10,    11,    12,    13,    14,
    15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
    25,   nil,     6,     4,    33,     7,     8,     9,    10,    11,
    12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
    22,    23,    24,    25,   nil,     6,     4,    33,     7,     8,
     9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
    19,    20,    21,    22,    23,    24,    25,   nil,     6,     4,
    33,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
   nil,     6,     4,    33,     7,     8,     9,    10,    11,    12,
    13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
    23,    24,    25,   nil,     6,     4,    33,     7,     8,     9,
    10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
    20,    21,    22,    23,    24,    25,   nil,     6,     4,    33,
     7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
    17,    18,    19,    20,    21,    22,    23,    24,    25,   nil,
     6,     4,    33,     7,     8,     9,    10,    11,    12,    13,
    14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
    24,    25,   nil,     6,     4,    33,     7,     8,     9,    10,
    11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
    21,    22,    23,    24,    25,   nil,     6,     4,    33,     7,
     8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
    18,    19,    20,    21,    22,    23,    24,    25,   nil,     6,
     4,    33,     7,     8,     9,    10,    11,    12,    13,    14,
    15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
    25,   nil,     6,     4,    33,     7,     8,     9,    10,    11,
    12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
    22,    23,    24,    25,   nil,     6,    33,     7,     8,     9,
    10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
    20,    21,    22,    23,    24,    25,   nil,     6,    33,     7,
     8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
    18,    19,    20,    21,    22,    23,    24,    25,   nil,     6,
    29,    30,    27,    28 ]

racc_action_check = [
    73,    73,    73,    73,    35,    35,    35,    35,    59,    59,
    59,    59,    60,    60,    60,    60,    61,    61,    61,    61,
    62,    62,    62,    62,    52,    52,     1,    73,    53,    53,
    35,     3,     5,    10,    59,    11,    12,    13,    60,    14,
    15,    16,    61,    17,    18,    19,    62,    63,    63,    63,
    63,    64,    64,    64,    64,    65,    65,    65,    65,    66,
    66,    66,    66,    67,    67,    67,    67,    68,    68,    68,
    68,    20,    21,    63,    22,    23,    24,    64,    26,    32,
    57,    65,   nil,   nil,   nil,    66,   nil,   nil,   nil,    67,
   nil,   nil,   nil,    68,    69,    69,    69,    69,    70,    70,
    70,    70,    71,    71,    71,    71,    72,    72,    72,    72,
    89,    89,    89,    89,     2,     2,     2,     2,   nil,   nil,
    69,   nil,   nil,   nil,    70,   nil,   nil,   nil,    71,   nil,
   nil,   nil,    72,   nil,   nil,   nil,    89,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,   nil,     0,
     6,     6,     6,     6,     6,     6,     6,     6,     6,     6,
     6,     6,     6,     6,     6,     6,     6,     6,     6,     6,
     6,   nil,     6,    27,    27,    27,    27,    27,    27,    27,
    27,    27,    27,    27,    27,    27,    27,    27,    27,    27,
    27,    27,    27,    27,   nil,    27,    28,    28,    28,    28,
    28,    28,    28,    28,    28,    28,    28,    28,    28,    28,
    28,    28,    28,    28,    28,    28,    28,   nil,    28,    29,
    29,    29,    29,    29,    29,    29,    29,    29,    29,    29,
    29,    29,    29,    29,    29,    29,    29,    29,    29,    29,
   nil,    29,    30,    30,    30,    30,    30,    30,    30,    30,
    30,    30,    30,    30,    30,    30,    30,    30,    30,    30,
    30,    30,    30,   nil,    30,    31,    31,    31,    31,    31,
    31,    31,    31,    31,    31,    31,    31,    31,    31,    31,
    31,    31,    31,    31,    31,    31,   nil,    31,    36,    36,
    36,    36,    36,    36,    36,    36,    36,    36,    36,    36,
    36,    36,    36,    36,    36,    36,    36,    36,    36,   nil,
    36,    37,    37,    37,    37,    37,    37,    37,    37,    37,
    37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
    37,    37,   nil,    37,    38,    38,    38,    38,    38,    38,
    38,    38,    38,    38,    38,    38,    38,    38,    38,    38,
    38,    38,    38,    38,    38,   nil,    38,    39,    39,    39,
    39,    39,    39,    39,    39,    39,    39,    39,    39,    39,
    39,    39,    39,    39,    39,    39,    39,    39,   nil,    39,
    40,    40,    40,    40,    40,    40,    40,    40,    40,    40,
    40,    40,    40,    40,    40,    40,    40,    40,    40,    40,
    40,   nil,    40,    41,    41,    41,    41,    41,    41,    41,
    41,    41,    41,    41,    41,    41,    41,    41,    41,    41,
    41,    41,    41,    41,   nil,    41,    42,    42,    42,    42,
    42,    42,    42,    42,    42,    42,    42,    42,    42,    42,
    42,    42,    42,    42,    42,    42,    42,   nil,    42,    43,
    43,    43,    43,    43,    43,    43,    43,    43,    43,    43,
    43,    43,    43,    43,    43,    43,    43,    43,    43,    43,
   nil,    43,    44,    44,    44,    44,    44,    44,    44,    44,
    44,    44,    44,    44,    44,    44,    44,    44,    44,    44,
    44,    44,    44,   nil,    44,    45,    45,    45,    45,    45,
    45,    45,    45,    45,    45,    45,    45,    45,    45,    45,
    45,    45,    45,    45,    45,    45,   nil,    45,    46,    46,
    46,    46,    46,    46,    46,    46,    46,    46,    46,    46,
    46,    46,    46,    46,    46,    46,    46,    46,    46,   nil,
    46,    47,    47,    47,    47,    47,    47,    47,    47,    47,
    47,    47,    47,    47,    47,    47,    47,    47,    47,    47,
    47,    47,   nil,    47,    48,    48,    48,    48,    48,    48,
    48,    48,    48,    48,    48,    48,    48,    48,    48,    48,
    48,    48,    48,    48,    48,   nil,    48,    49,    49,    49,
    49,    49,    49,    49,    49,    49,    49,    49,    49,    49,
    49,    49,    49,    49,    49,    49,    49,    49,   nil,    49,
    50,    50,    50,    50,    50,    50,    50,    50,    50,    50,
    50,    50,    50,    50,    50,    50,    50,    50,    50,    50,
    50,   nil,    50,    88,    88,    88,    88,    88,    88,    88,
    88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
    88,    88,    88,    88,   nil,    88,     4,     4,     4,     4,
     4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
     4,     4,     4,     4,     4,     4,   nil,     4,    34,    34,
    34,    34,    34,    34,    34,    34,    34,    34,    34,    34,
    34,    34,    34,    34,    34,    34,    34,    34,   nil,    34,
    56,    56,    56,    56 ]

racc_action_pointer = [
   130,    26,   110,     3,   658,    30,   153,   nil,   nil,   nil,
     4,     6,     7,     8,    10,    11,    12,    14,    15,    16,
    42,    43,    45,    46,    47,   nil,    78,   176,   199,   222,
   245,   268,    77,   nil,   680,     0,   291,   314,   337,   360,
   383,   406,   429,   452,   475,   498,   521,   544,   567,   590,
   613,   nil,    20,    24,   nil,   nil,   706,    78,   nil,     4,
     8,    12,    16,    43,    47,    51,    55,    59,    63,    90,
    94,    98,   102,    -4,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   636,   106,
   nil ]

racc_action_default = [
   -31,   -31,    -1,   -11,   -31,    -8,   -31,   -12,   -13,   -14,
   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,
   -31,   -31,   -31,   -31,   -31,   -30,   -31,   -31,   -31,   -31,
   -31,   -31,    -7,   -11,   -31,   -31,   -31,   -31,   -31,   -31,
   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,
   -31,    91,    -3,    -4,    -5,    -6,    -2,    -9,   -10,   -31,
   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,
   -31,   -31,   -31,   -31,   -15,   -16,   -17,   -18,   -19,   -20,
   -21,   -22,   -23,   -24,   -25,   -26,   -27,   -28,   -31,   -31,
   -29 ]

racc_goto_table = [
     2,     1,    32,   nil,   nil,   nil,    35,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    52,    53,    54,
    55,    56,    57,   nil,   nil,   nil,    59,    60,    61,    62,
    63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
    73,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    89 ]

racc_goto_check = [
     2,     1,     3,   nil,   nil,   nil,     2,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,     2,     2,
     2,     2,     3,   nil,   nil,   nil,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     1,     0,    -2 ]

racc_goto_default = [
   nil,   nil,   nil,     5 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 33, :_reduce_1,
  3, 33, :_reduce_2,
  3, 34, :_reduce_3,
  3, 34, :_reduce_4,
  3, 34, :_reduce_5,
  3, 34, :_reduce_6,
  2, 34, :_reduce_7,
  1, 34, :_reduce_none,
  3, 35, :_reduce_9,
  3, 35, :_reduce_10,
  1, 35, :_reduce_11,
  1, 35, :_reduce_none,
  1, 35, :_reduce_13,
  1, 35, :_reduce_14,
  4, 35, :_reduce_15,
  4, 35, :_reduce_16,
  4, 35, :_reduce_17,
  4, 35, :_reduce_18,
  4, 35, :_reduce_19,
  4, 35, :_reduce_20,
  4, 35, :_reduce_21,
  4, 35, :_reduce_22,
  4, 35, :_reduce_23,
  4, 35, :_reduce_24,
  4, 35, :_reduce_25,
  4, 35, :_reduce_26,
  4, 35, :_reduce_27,
  4, 35, :_reduce_28,
  6, 35, :_reduce_29,
  1, 35, :_reduce_30 ]

racc_reduce_n = 31

racc_shift_n = 91

racc_token_table = {
  false => 0,
  :error => 1,
  :POWER => 2,
  :UMINUS => 3,
  "*" => 4,
  "/" => 5,
  "+" => 6,
  "-" => 7,
  :ID => 8,
  :NUM => 9,
  :PI => 10,
  :E => 11,
  :sqrt => 12,
  :sin => 13,
  :cos => 14,
  :tan => 15,
  :asin => 16,
  :acos => 17,
  :atan => 18,
  :exp => 19,
  :ln => 20,
  :log => 21,
  :abs => 22,
  :fact => 23,
  :floor => 24,
  :ceil => 25,
  :round => 26,
  :v => 27,
  "=" => 28,
  "(" => 29,
  ")" => 30,
  "," => 31 }

racc_nt_base = 32

racc_use_result_var = false

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "POWER",
  "UMINUS",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "ID",
  "NUM",
  "PI",
  "E",
  "sqrt",
  "sin",
  "cos",
  "tan",
  "asin",
  "acos",
  "atan",
  "exp",
  "ln",
  "log",
  "abs",
  "fact",
  "floor",
  "ceil",
  "round",
  "v",
  "\"=\"",
  "\"(\"",
  "\")\"",
  "\",\"",
  "$start",
  "statement",
  "expression",
  "primary" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'calc.y', 11)
  def _reduce_1(val, _values)
     @v = val[0]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 12)
  def _reduce_2(val, _values)
     @v = @table[val[0].to_sym] = val[2]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 13)
  def _reduce_3(val, _values)
     val[0] + val[2]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 14)
  def _reduce_4(val, _values)
     val[0] - val[2]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 15)
  def _reduce_5(val, _values)
     val[0] * val[2]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 16)
  def _reduce_6(val, _values)
     if (val[2] != 0.0) then val[0] / val[2] else raise("Division by zero.") end
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 17)
  def _reduce_7(val, _values)
     -(val[1])
  end
.,.,

# reduce 8 omitted

module_eval(<<'.,.,', 'calc.y', 19)
  def _reduce_9(val, _values)
     val [0] ** val[2]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 20)
  def _reduce_10(val, _values)
     val[1]
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 21)
  def _reduce_11(val, _values)
    if @table[val[0].to_sym] then @table[val[0].to_sym] else raise("#{val[0]} not found.") end
  end
.,.,

# reduce 12 omitted

module_eval(<<'.,.,', 'calc.y', 23)
  def _reduce_13(val, _values)
     Math::PI
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 24)
  def _reduce_14(val, _values)
     Math::E
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 25)
  def _reduce_15(val, _values)
     sqrt(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 26)
  def _reduce_16(val, _values)
     sin(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 27)
  def _reduce_17(val, _values)
     cos(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 28)
  def _reduce_18(val, _values)
     tan(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 29)
  def _reduce_19(val, _values)
     asin(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 30)
  def _reduce_20(val, _values)
     acos(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 31)
  def _reduce_21(val, _values)
     atan(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 32)
  def _reduce_22(val, _values)
     exp(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 33)
  def _reduce_23(val, _values)
     log(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 34)
  def _reduce_24(val, _values)
     log10(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 35)
  def _reduce_25(val, _values)
     val[2].abs
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 36)
  def _reduce_26(val, _values)
     fact(val[2])
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 37)
  def _reduce_27(val, _values)
     val[2].floor.to_f
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 38)
  def _reduce_28(val, _values)
     val[2].ceil.to_f
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 39)
  def _reduce_29(val, _values)
     val[2].round(val[4]).to_f
  end
.,.,

module_eval(<<'.,.,', 'calc.y', 40)
  def _reduce_30(val, _values)
     @v
  end
.,.,

def _reduce_none(val, _values)
  val[0]
end

end   # class Calc

#
