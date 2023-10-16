日本語の解説が後半にあります。

### What is this program?

The program 'calc' is a simple calculator written in Ruby programming language.
It is run from the command line like this.

```
$ calc
calc > 10+20
30
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
3. Type `gem build s_calc` under the directory 'calc', then the gem file `s_calc-0.1.2.gem` is created.
The number `0.1.2` is the version number.
4. Type `gem install s_calc-0.1.2`.

Another way is simpler.
This gem is published to RubyGems.org.
You can install it from RubyGems.

```
$ gem install s_calc
```

Be careful.
The command name and GitHub repository name is `calc` but the gem name is `s_calc`.
This is because the name `calc` has already existed in RubyGems.org.

### How to use the program.

1. Start the terminal and type 'calc'.
2. Then a prompt appears '$ calc > '
3. Type an expression like '2+3' and push Enter key, then the answer '5' appears.
4. Type 'quit' or 'exit', then the program will finish.
5. You can also use it as a one line calculator like `$ calc "10*20+30"`.

### feature

- Operatores: `+`, `-`, `*`, `/`, `**`(power), `-`(unary minus), `(` and `)`
- keywords: `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `log`, `sqrt` and `v`.
- Variable can be used.
It is a string of alphabets without the keywords above.
It can be used in any place in the expression.
`variable_name = expression` is the syntax to define the variable.
A defined variable can be used in an expression instead of a number.
- calc remembers the value of the previous calculation.
The value is referred by the special variable `v`.
- Mathematical functions can be used such as `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `log` and `sqrt`.
- The library file `lib/calc/calc.rb` is made by Racc, which is a ruby version `yacc`.
The source file is `racc/calc.y`.
See `racc/doc.md` for details.

### Rakefile

You can do the following

- `rake`: Compile `racc/calc.y` and create/update `lib/calc/calc.rb`.
- `rake rdoc`: Create documents under `docs` directory.
- `rake test`: Run test programs under `test` directory.

### License

GPL ver 3 or later.
See [License.md](License.md) for details.

### これは何のプログラム？

Rubyプログラム`calc.rb`は簡易電卓です。
コマンドラインから次のように起動できます。

```
$ calc
calc > 10+20
30
calc > quit
$
```

### 動作条件

- Linux OS
- Ruby 3.1.2 or later (maybe older version is also OK)

### インストール

2通りのインストール方法があります。

1. 'Code'ボタンをクリックし、現れた小さなダイアログの'Download ZIP'をクリックする
2. ダウンロードしたZipファイルを解凍する。これにより新しく「calc」ディレクトリが作られ、その中にすべてのファイルが収められる
3. 「gem build s_calc」を実行することにより、gemファイル「s_calc-0.1.2.gem」が作られる。
4. 「gem install s_calc-0.1.2」とタイプし、gemをインストールする。

別な簡単なインストール方法はRubyGemsからインストールすることです。

```
$ gem install s_calc
```

コマンド名とGitHubのレポジトリ名が`calc`であるのに対して、gem名は`s_calc`であることに注意してください。
これは、RubyGemsには既に`calc`という名前のgemが存在しており、異なるgem名が必要だったためです。

### 使い方

1. 解凍したフォルダで端末（コマンドライン）を起動し、「calc」と入力する
2. プロンプト「$ calc >」が現れる
3. 式（例えば2+3）と入力し、エンターキーを押すと、答え「5」が表示される
4. 「quit」または「exit」とタイプするとプログラムは終了する
5. 引数を付けて一行計算アプリとしても使える。（例）`$ calc "10*20+30"`

### 特長

- 次の演算記号が使える。`+`, `-`, `*`, `/`, `**`(累乗), `-`(単項マイナス), `(`, `)`
- 予約語: `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `log`, `sqrt`, `v`
- 変数が使える。
変数はアルファベットからなり文字列である。
変数は式の中のどこにでも使うことができる。
`変数名 = 式` により、変数に値を代入することができる。
定義された変数は式の中で使うことができる
- calcは直前の計算結果を記憶している。
変数`v` でその値を参照できる
- 関数が使える。`sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `exp`, `log`, `sqrt`.
- ライブラリ・ファイル`lib/calc/calc.rb`はRaccによって生成されたものである。
そのソースファイルは`racc/calc.y`。
詳しい説明は、`racc/oc.md`を参照のこと。

### Rakefile

次のことができます。

- `rake`: `racc/calc.y`をコンパイルして`lib/calc/calc.rb`を生成する
- `rake rdoc`: `docs`ディレクトリ以下にドキュメントを生成する
- `rake test`: `test`ディレクトリの下にあるテストプログラムを実行する

### ライセンス

Copyright (C) 2022,2023  ToshioCP (関谷 敏雄)

このプログラムは、フリーソフトウェア財団によって発行された「GNU一般公衆利用許諾書」(バージョン3か、希望によってはそれ以降のバージョンのうちどれか)の定める条件の下で再頒布または改変することができる。

このプログラムは有用であることを願って頒布されますが、*全くの無保証* です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含め全く存在しません。
詳しくは[GNU 一般公衆利用許諾書(英語)](https://www.gnu.org/licenses/gpl-3.0.en.html)、またはその日本語訳[GNU 一般公衆利用許諾書の日本語訳](https://gpl.mhatta.org/gpl.ja.html)をご覧ください。

なお、ライセンスを英語で記した[License.md](License.md)もあります。
