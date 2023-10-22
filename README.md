日本語の解説が後半にあります。

### What is this program?

The program 'calc' is a scientific calculator written in Ruby programming language.
It is run from the command line like this.

```
$ calc 2*3+4*5
26
$ calc
calc > 0.1-0.2
-0.1
calc > sin(PI/6)
0.49999999999999994 # Float always includes error.
calc > quit
$
```

### Prerequisites

- Linux OS
- Ruby 3.1.2 or later (maybe older version is also OK)

### installation

There are two ways.

1. Click the 'Code' button, then click 'Download ZIP' in the small dialog.
2. Unzip the downloaded Zip file, then a new directory 'calc' will be created.
3. Type `gem build s_calc` under the directory 'calc', then the gem file `s_calc-X.X.X.gem` is created.
The part `X.X.X` is a version number like `0.1.4`.
4. Type `gem install s_calc-X.X.X.gem`.

Another way is simpler.
This gem is published to RubyGems.org.
You can install it from RubyGems.
Just type:

```
$ gem install s_calc
```

Be careful.
The command name and GitHub repository name is `calc` but the gem name is `s_calc`.
This is because the name `calc` has already existed in RubyGems.org.

### How to use the program.

1. Start the terminal and type `calc`.
2. Then the prompt appears `calc > `
3. Type an expression like `2+3` and push Enter key, then the answer `5` appears.
4. Type `quit`, `q` or `exit`, then the program will finish.
5. You can also use it as a one line calculator like `$ calc "10*20+30"`.

### feature

- Operatores: `+`, `-`, `*`, `/`, `**`(power), `-`(unary minus), `(` and `)`
- Functions: `sqrt`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `ln`, `log`, `abs`, `fact`, `floor`, `ceil` and `round`.
- The special variable `v` keeps the result of the previous calculation.
- Variable can be used.
It is a string of alphabets without the keywords above.
It can be used in any place in the expression.
`variable_name = expression` is the syntax to define the variable.
A defined variable can be used in an expression.

### Functions

- `sqrt`: Square root. `sqrt(4) => 2`
- `sin`: `sin(PI) => 1.2246467991473532e-16` It is well known that sin(PI) is zero. But Float always includes error.
- `cos`: `cos(PI) => -1`
- `tan`: `tan(PI/4) => 0.9999999999999999` The answer includes error. The exact value is 1.
- `asin`: Inverse of the sine function. `asin(1) => 1.5707963267948966` This is PI/2
- `acos`: Inverse of the cosine function. `acos(1) => 0`
- `atan`: Inverse of the tangent function. `atan(1) => 0.7853981633974483` This is PI/4
- `exp`: Exponential function. `exp(n)` means `e` raised to the power of n. `exp(1) => 2.718281828459045` It is E.
- `ln`: Natural logarithm. `ln(E) => 1`
- `log`: Common logarithm or decimal logarithm. The base is 10. `log(10) => 1`
- `abs`: Absolute value. `abs(-10) =>10`
- `fact`: Factorial. `fact(10) => 3628800` The argument must be non-negative. If it isn't an integer, it will be rounded down to an integer. It must be less than 171 because of the limitation of Float.
- `floor`: Floor function. `floor(3.45) => 3`
- `ceil`: Ceiling function. `ceil(3.45) => 4`
- `round`: Rounding function. `round(3.45,1) => 3.5, round(-3.45,1) => -3.5` The rounding is done away from zero if the argument is at the middle of two candidates.

### Racc library

Racc is a Ruby standard library.
It is a parser generator like Yacc, which is a famous parser generator made for the Unix Operating system.
Calc uses Racc.
It makes the library file `lib/calc/calc.rb` with Racc.
The source file is `racc/calc.y`.
You can compile it by typing:

```
$ rake
```

See `racc/doc.md` for details.

### Rakefile

You can do the following

- `rake`: Compile `racc/calc.y` and create/update `lib/calc/calc.rb`.
- `rake rdoc`: Create documents under `docs` directory.
- `rake test`: Run test programs under `test` directory.

### Using Calc as a library

You can use Calc as a library in your Ruby program.

- First, require 'calc'.
- Create an instance of the class `Calc`. Let the instance name be 'c'.
- Call `c.run(s)` where `s` is a string of an expression. Then it returns the value of the expression.
For example, `c.run("1+2")` returns 3.0.
- The instance method `parse` on the class `Calc` is an alias of `run`.
So, you can use `parse` instead of `run`.

The following is a sample code.

```ruby
require 'calc'

c = Calc.new
s = "1+2"
print "#{c.run(s)}\n" #=> 3.0
```

### License

GPL ver 3 or later.
See [License.md](License.md) for details.

### これは何のプログラム？

Rubyプログラム`calc.rb`は関数電卓です。
コマンドラインから次のように起動できます。

```
$ calc 2*3+4*5
26
$ calc
calc > 0.1-0.2
-0.1
calc > sin(PI/6)
0.49999999999999994 # 実数計算では誤差が発生します
calc > quit
$
```

### 動作条件

- Linux OS
- Ruby バージョン3.1.2以降（おそらく不利バージョンでも動作します）

### インストール

2通りのインストール方法があります。

1. 'Code'ボタンをクリックし、現れた小さなダイアログの'Download ZIP'をクリックする
2. ダウンロードしたZipファイルを解凍する。これにより新しく「calc」ディレクトリが作られ、その中にすべてのファイルが収められる
3. 「gem build s_calc」を実行することにより、gemファイル「s_calc-X.X.X.gem」が作られる。「X.X.X」の部分はバージョン番号で、例えば「0.1.4」のような数字である
4. 「gem install s_calc-X.X.X.gem」とタイプし、gemをインストールする

もっと簡単なインストール方法は、RubyGemsからインストールすることです。
次のようにタイプするだけでgemをダウンロードしインストールします。

```
$ gem install s_calc
```

コマンド名とGitHubのレポジトリ名が`calc`であるのに対して、gem名は`s_calc`であることに注意してください。
これは、RubyGemsには既に`calc`という名前のgemが存在しており、異なるgem名が必要だったためです。

### 使い方

1. 解凍したフォルダで端末（コマンドライン）を起動し、「calc」と入力する
2. プロンプト「calc >」が現れる
3. 式（例えば2+3）と入力し、エンターキーを押すと、答え「5」が表示される
4. 「quit」または「q」または「exit」とタイプするとプログラムは終了する
5. 引数を付けて一行計算アプリとしても使える。（例）`$ calc "10*20+30"`

### 特長

- 次の演算記号が使える。`+`, `-`, `*`, `/`, `**`(累乗), `-`(単項マイナス), `(`, `)`
- 関数: `sqrt`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `ln`, `log`, `abs`, `fact`, `floor`, `ceil` and `round`.
- 変数が使える
- calcは直前の計算結果を記憶しており、変数`v` でその値を参照できる
- 変数はアルファベットからなる文字列で、上記のキーワードを除く。
`変数名 = 式` により、変数に値を代入することができる。
定義された変数は、式の中で使うことができる

### 関数

- `sqrt`: 平方根。 `sqrt(4) => 2`
- `sin`: `sin(PI) => 1.2246467991473532e-16` sin(PI)はゼロですが、浮動小数点の計算は常に誤差が生じます
- `cos`: `cos(PI) => -1`
- `tan`: `tan(PI/4) => 0.9999999999999999` 答えは誤差を含んでいます。正確には1になります
- `asin`: サインの逆三角関数。`asin(1) => 1.5707963267948966` これはPI/2です
- `acos`: コサインの逆三角関数。`acos(1) => 0`
- `atan`: タンジェントの逆三角関数。`atan(1) => 0.7853981633974483` これはPI/4です
- `exp`: 指数関数。 `exp(n)`は`e`のn乗。`exp(1) => 2.718281828459045` これはEです
- `ln`: 自然対数。底がeの対数。`ln(E) => 1`
- `log`: 常用対数。底が10の対数。`log(10) => 1`
- `abs`: 絶対値。`abs(-10) =>10`
- `fact`: 階乗。`fact(10) => 3628800` 引数はゼロ以上。引数が整数でなければ、切り捨てて整数に直す。引数は171より小さくなければならない。答えがFloatの最大値を越えないように制限するため。
- `floor`: フロアー関数。小数点以下を切り捨て。`floor(3.45) => 3`
- `ceil`: シーリング関数。小数点以下を切り上げ。`ceil(3.45) => 4`
- `round`: 四捨五入関数。`round(3.45,1) => 3.5, round(-3.45,1) => -3.5` 丸める桁が5である場合は、ゼロから遠い方に丸める。

### Racc

RaccはRubyの標準ライブラリーです。
パーサー・ジェネレーターと呼ばれ、Unixオペレーティングシステム上の有名なYaccに似ています。
CalcはRaccを使って`lib/calc/calc.rb`を生成しています。
そのソース・ファイルは`racc/calc.y`です。
コンパイルは次のようにタイプするだけでできます。

```
$ rake
```

ドキュメント `racc/doc.md`を参照してください。

### Rakefile

次のことができます。

- `rake`: `racc/calc.y`をコンパイルして`lib/calc/calc.rb`を生成する
- `rake rdoc`: `docs`ディレクトリ以下にドキュメントを生成する
- `rake test`: `test`ディレクトリの下にあるテストプログラムを実行する

### Calcをライブラリとして使う

CalcをライブラリとしてRubyプログラムの中で使うことができます。

- まず、'calc'をrequireする
- `Calc`クラスのインスタンスを生成する。仮にその名前を`c`とする
- 数式を表す文字列を`s`とすると、`c.run(s)`はその数式を計算した値を返す
例えば、`c.run("1+2")`は3.0を返す
- インスタンス・メソッド`run`のエイリアス`parse`を代わりに使うことができる

以下に簡単なサンプルコードを示します。

```ruby
require 'calc'

c = Calc.new
s = "1+2"
print "#{c.run(s)}\n" #=> 3.0
```

### ライセンス

Copyright (C) 2022,2023  ToshioCP (関谷 敏雄)

このプログラムは、フリーソフトウェア財団によって発行された「GNU一般公衆利用許諾書」(バージョン3か、希望によってはそれ以降のバージョンのうちどれか)の定める条件の下で再頒布または改変することができる。

このプログラムは有用であることを願って頒布されますが、*全くの無保証* です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含め全く存在しません。
詳しくは[GNU 一般公衆利用許諾書(英語)](https://www.gnu.org/licenses/gpl-3.0.en.html)、またはその日本語訳[GNU 一般公衆利用許諾書の日本語訳](https://gpl.mhatta.org/gpl.ja.html)をご覧ください。

なお、ライセンスを英語で記した[License.md](License.md)もあります。
