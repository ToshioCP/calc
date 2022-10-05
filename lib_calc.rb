
class Calc
  include Math

  def initialize
    @table = {}
    @value = 0.0
  end

  def run(s)
    parse(lex(s))
  end

  def lex(s)
    result = []
    while true
      break if s == ""
      case s[0]
      when /[[:alpha:]]/
        m = /\A([[:alpha:]]+)(.*)\Z/m.match(s)
        name = m[1]; s = m[2]
        if name =~ /sin|cos|tan|asin|acos|atan|exp|log|sqrt|PI|E|v/
          result << [$&.to_sym, nil]
        else
          result << [:id, name]
        end
      when /[[:digit:]]/
        m = /\A([[:digit:]]+(\.[[:digit:]]*)?)(.*)\Z/m.match(s)
        result << [:num, m[1].to_f]
        s = m[3]
      when /[+\-*\/()=;]/
        if s =~ /^\*\*/
          result << [s[0,2].to_sym,nil]
          s = s[2..-1]
        else
          result << [s[0].to_sym, nil]
          s = s[1..-1]
        end
      when /\s/
        s = s[1..-1] 
      else
        raise "Unexpected character."
      end
    end
    result
  end

  # BNF
  # program: program ';' statement
  #        |  statement;
  # statement: expression_0
  #   | ID '=' expression
  #   ;
  # expression_0: expression {print @value};
  # expression: expression '+' factor1
  #   | expression '-' factor1
  #   | factor0
  #   ;
  # factor0: factor1
  #   | '-' factor1
  #   ;
  # factor1: factor1 '*' power
  #   | factor1 '/' power
  #   | power
  #   ;
  # power: primary ** power
  #   | primary
  #   ;
  # primary: ID | NUM | 'PI' | 'E' | '(' expression ')' | function '(' expression ')'| 'v';
  # function: 'sin' | 'cos' | 'tan' | 'asin' | 'acos' | 'atan' | 'exp' | 'log' ;

  # error => return nil

  def parse(tokens)
    @error_already_issued = false
    tokens.reverse!
    return unless statement(tokens) # error => return
    return if tokens == [] # no input => return (success)
    token = tokens.pop.to_a
    while token[0] == :';'
      return unless statement(tokens) # error => return
      return if tokens == [] # no input => return (success)
      token = tokens.pop.to_a
    end
    syntax_error unless token == []
  end

  private

  def statement(tokens)
    token = tokens.pop.to_a
    case token[0]
    when :id
      a = token[1]
      b = tokens.pop.to_a
      if  b[0] == :'='
        c = expression(tokens)
        unless c
          syntax_error
          return false
        end
        install(a, c)
        @value = c
      else
        tokens.push(b) if b[0]
        tokens.push(token)
        expression_0(tokens)
      end
    when nil
      return false
    else
      tokens.push(token)
      expression_0(tokens)
    end
  end

  def expression_0(tokens)
    b = expression(tokens)
    return false unless b
    @value = b
    b = b.to_i if b == b.floor
    print "#{b}\n"
    @value
  end

  def expression(tokens)
    return false unless (a = factor0(tokens))
    while true
      token = tokens.pop.to_a
      case token[0]
      when :'+'
        b = factor1(tokens)
        unless b
          syntax_error
          break false
        end
        a = a+b
      when :'-'
        b = factor1(tokens)
        unless b
          syntax_error
          break false
        end
        a = a-b
      when nil
        return a
      else
        tokens.push(token)
        break a
      end
    end
  end

  def factor0(tokens)
    token = tokens.pop.to_a
    case token[0]
    when :'-'
      b = factor1(tokens)
      b ? -b : false
    when nil
      false
    else
      tokens.push(token)
      factor1(tokens)
    end
  end

  def factor1(tokens)
    return false unless (a = power(tokens))
    while true
      token = tokens.pop.to_a
      case token[0]
      when :'*'
        b = power(tokens)
        unless b
          syntax_error
          break false
        end
        a = a*b
      when :'/'
        b = power(tokens)
        unless b
          syntax_error
          break false
        end
        if b == 0
          print "Division by 0.\n"
          break false
        end
        a = a/b
      when nil
        break a
      else
        tokens.push(token)
        break a
      end
    end
  end

  def power(tokens)
    return false unless (a = primary(tokens))
    token = tokens.pop.to_a
    case token[0]
    when :'**'
      b = power(token)
      if b
        a**b
      else
        syntax_error
        false
      end
    when nil
      a
    else
      tokens.push(token)
      a
    end
  end

  def primary(tokens)
    token = tokens.pop.to_a
    case token[0]
    when :id
      a = lookup(token[1])
      print "Variable #{token[1]} not defined.\n" unless a
      a ? a : false
    when :num
      token[1]
    when :PI
      PI
    when :E
      E
    when :'('
      b = expression(tokens)
      return false unless b
      unless tokens.pop.to_a[0] == :')'
        syntax_error
        return false
      end
      b
    when :sin, :cos, :tan, :asin, :acos, :atan, :exp, :log, :sqrt
      f = token[0]
      unless tokens.pop.to_a[0] == :'('
        syntax_error
        return false
      end
      b = expression(tokens)
      return false unless b
      unless tokens.pop.to_a[0] == :')'
        syntax_error
        return false
      end
      method(f).call(b)
    when :v
      @value
    when nil
      false
    else
      syntax_error
      false
    end
  end

  def install(name, value)
    @table[name] = value
  end
  def lookup(name)
    @table[name]
  end

  def syntax_error
    print "Syntax error.\n" unless @error_already_issued
    @error_already_issued = true
  end
end
