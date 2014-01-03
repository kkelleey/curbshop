Hey Karen!

All in all looks really good.  Here are some things to consider:

1) Make sure to practice Ruby Style best practices.  A couple of things I noticed:
  * Setting variables `@item=Item.first` should be `@item = Item.first`
  * Logical not operator `! item` should be `!item`
2) You did some pretty advanced stuff in your models with ActiveRecord.  Very nice!
3) Ruby has an implicit return in method calls, so double check to make sure you can't just leverage that fact
4) Consider using the ternary operator `condition ? true case : false case` to simplify if/else statements


