## To create lib/calc/calc.rb, do the following

```
$ cd (this directory)
$ racc -o ../lib/calc/calc.rb calc.y
```

## What's calc.y?

The file `calc.y` is a source file of `racc`.
Racc is a ruby version `yacc`.
It makes a parser from the BNF form definition.
See [Racc user manual](https://i.loveruby.net/en/projects/racc/doc/) for further information.
