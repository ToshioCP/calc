class Calc
  prechigh
    right POWER
    nonassoc UMINUS
    left '*' '/'
    left '+' '-'
  preclow
  options no_result_var
  token ID NUM PI E sqrt sin cos tan asin acos atan exp ln log abs fact floor ceil round v

rule
  statement   : expression { @v = val[0] }
              | ID '=' expression { @v = @table[val[0].to_sym] = val[2] }
  expression  : expression '+' expression { val[0] + val[2] }
              | expression '-' expression { val[0] - val[2] }
              | expression '*' expression { val[0] * val[2] }
              | expression '/' expression { if (val[2] != 0.0) then val[0] / val[2] else raise("Division by zero.") end }
              | '-' primary  =UMINUS { -(val[1]) }
              | primary
  primary     : primary POWER primary { val [0] ** val[2] }
              | '(' expression ')' { val[1] }
              | ID {if @table[val[0].to_sym] then @table[val[0].to_sym] else raise("#{val[0]} not found.") end }
              | NUM
              | PI { Math::PI }
              | E { Math::E }
              | sqrt '(' expression ')' { sqrt(val[2]) }
              | sin '(' expression ')' { sin(val[2]) }
              | cos '(' expression ')' { cos(val[2]) }
              | tan '(' expression ')' { tan(val[2]) }
              | asin '(' expression ')' { asin(val[2]) }
              | acos '(' expression ')' { acos(val[2]) }
              | atan '(' expression ')' { atan(val[2]) }
              | exp '(' expression ')' { exp(val[2]) }
              | ln '(' expression ')' { log(val[2]) }
              | log '(' expression ')' { log10(val[2]) }
              | abs '(' expression ')' { val[2].abs }
              | fact '(' expression ')' { fact(val[2]) }
              | floor '(' expression ')' { val[2].floor.to_f }
              | ceil '(' expression ')' { val[2].ceil.to_f }
              | round '(' expression ',' expression ')' { val[2].round(val[4]).to_f }
              | v { @v }
end

---- header

require 'strscan'
include Math

---- inner
 
def initialize
  @table = {}
end

def run(s)
  @tokens = []
  lex(s)
  do_parse
end

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

---- footer
#
