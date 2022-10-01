
class Calc
  include Math

  def initialize
    @table = {}
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
        if name =~ /sin|cos|tan|asin|acos|atan|exp|log|sqrt|store|PI|E/
          result << [$&.to_sym, nil]
        else
          result << [:id, name]
        end
      when /[[:digit:]]/
        m = /\A([[:digit:]]+(\.[[:digit:]]*)?)(.*)\Z/m.match(s)
        result << [:num, m[1].to_f]
        s = m[3]
      when /[+\-*\/()=]/
        result << [s[0].to_sym, nil]
        s = s[1..-1]
      when /\s/
        s = s[1..-1] 
      else
        raise "Unexpected character."
      end
    end
    result
  end

  # BNF
  # program: statement | program statement;
  # statement: expression
  #   | ID '=' expression
  #   | 'store' ID
  #   ;
  # expression: factor0 '+' factor1
  #   | factor0 '-' factor1
  #   | factor0
  #   ;
  # factor0: factor1
  #   | '-' factor1
  #   ;
  # factor1: primary '*' primary
  #   | primary '-' primary
  #   | primary
  #   ;
  # primary: ID | NUM | '(' expression ')' | function '(' expression ')' ;
  # function: 'sin' | 'cos' | 'tan' | 'asin' | 'acos' | 'atan' | 'exp' | 'log' ;

  # error => return nil

  def parse(tokens)
    tokens.reverse!
    while true
      return if statement(tokens) == nil
    end
  end

  private

  def statement(tokens)
    token = tokens.pop.to_a
    case token[0]
    when :id
      a = token[1]
      b = tokens.pop
      if b == nil
        tokens.push(token)
        expression_0(tokens)
      elsif  b[0] == :'='
        c = expression(tokens)
        return nil if c == nil
        install(a, c)
        @value = c
      else
        tokens.push(b)
        tokens.push(token)
        expression_0(tokens)
      end
    when :store
      token = tokens.pop.to_a
      unless token[0] == :id
        syntax_error
        return nil
      end
      install(token[1], @value.to_f)
    when nil
      return nil
    else
      tokens.push(token)
      expression_0(tokens)
    end
  end

  def expression_0(tokens)
    b = expression(tokens)
    return nil if b == nil
    b = b.to_i if b == b.floor
    print "#{b}\n"
    @value = b
  end

  def expression(tokens)
    return nil if (a = factor0(tokens)) == nil
    token = tokens.pop.to_a
    case token[0]
    when :'+'
      b = factor1(tokens)
      b ? a+b : nil
    when :'-'
      b = factor1(tokens)
      b ? a-b : nil
    else
      tokens.push(token)
      a
    end
  end

  def factor0(tokens)
    token = tokens.pop.to_a
    case token[0]
    when :'-'
      b = factor1(tokens)
      b ? -b : nil
    when nil
      nil
    else
      tokens.push(token)
      factor1(tokens)
    end
  end

  def factor1(tokens)
    return nil if (a = primary(tokens)) == nil
    token = tokens.pop.to_a
    case token[0]
    when :'*'
      b = primary(tokens)
      b ? a*b : nil
    when :'/'
      b = primary(tokens)
      if b == 0
        print "Division by 0.\n"
        return nil
      end
      b ? a/b : nil
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
      print "Variable #{token[1]} not defined.\n" if a == nil
      return a
    when :num
      token[1]
    when :PI
      PI
    when :E
      E
    when :'('
      b = expression(tokens)
      return nil if b == nil
      unless tokens.pop.to_a[0] == :')'
        syntax_error
        return nil
      end
      b
    when :sin, :cos, :tan, :asin, :acos, :atan, :exp, :log, :sqrt
      f = token[0]
      unless tokens.pop.to_a[0] == :'('
        syntax_error
        return nil
      end
      b = expression(tokens)
      return nil if b == nil
      unless tokens.pop.to_a[0] == :')'
        syntax_error
        return nil
      end
      method(f).call(b)
    else
      syntax_error
      nil
    end
  end

  def install(name, value)
    @table[name] = value
  end
  def lookup(name)
    @table[name]
  end

  def syntax_error
    print "Syntax error.\n"
  end
end
