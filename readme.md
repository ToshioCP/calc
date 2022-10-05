日本語の解説が後半にあります。

### What is this program?

The program 'calc' is a simple calculator written in Ruby programming language.
It is run from the command line like this.

~~~
$ calc
calc > 10+20
30
calc > quit
$
~~~

### Prerequisites

- Linux OS
- Ruby 3.1.2 or later (maybe older version is also OK)

### installation

1. Click the 'Code' button, then click 'Download ZIP' in the small dialog.
2. Unzip the downloaded Zip file, then a new directory 'calc' will be created.
3. Run "ruby install.rb" under the directory 'calc', then the program 'calc' is installed in '$HOME/bin'.

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

### License

Copyright (C) 2022  ToshioCP (Toshio Sekiya)

The programs packed in this repository are free; you can redistribute them and/or modify them under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License or, at your option, any later version.

They are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.html) for more details.

### これは何のプログラム？

Rubyプログラム`calc.rb`は簡易電卓です。
コマンドラインから次のように起動できます。

~~~
$ calc
calc > 10+20
30
calc > quit
$
~~~

### 動作条件

- Linux OS
- Ruby 3.1.2 or later (maybe older version is also OK)

### インストール

1. 'Code'ボタンをクリックし、現れた小さなダイアログの'Download ZIP'をクリックする
2. ダウンロードしたZipファイルを解凍する。これにより新しく「calc」ディレクトリが作られ、その中にすべてのファイルが収められる
3. 「ruby install.rb」を実行することにより、プログラム「calc」が「$HOME/bin」直下にインストールされる

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

### ライセンス

Copyright (C) 2022  ToshioCP (関谷 敏雄)

このプログラムは、フリーソフトウェア財団によって発行された「GNU一般公衆利用許諾書」(バージョン3か、希望によってはそれ以降のバージョンのうちどれか)の定める条件の下で再頒布または改変することができる。

このプログラムは有用であることを願って頒布されますが、*全くの無保証* です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含め全く存在しません。
詳しくは[GNU 一般公衆利用許諾書(英語)](https://www.gnu.org/licenses/gpl-3.0.en.html)、またはその日本語訳[GNU 一般公衆利用許諾書の日本語訳](https://gpl.mhatta.org/gpl.ja.html)をご覧ください。
