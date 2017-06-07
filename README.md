# Connect Four

This Ruby code was first created to satisfy an assignment from [The Odin Project](http://www,theodinproject.com).

## What Does It Do?

[Connect Four](https://en.wikipedia.org/wiki/Connect_Four) is a board game for two players. The board has a seven rows and six columns. Each player takes turns stacking their colored tokens into the bottom-most position of each of the six columns. The first player to stack four tokens in a row, either horizontally, vertically, or diagonally, wins! This command-line game is exactly that.

## Getting Started

To run the app locally, clone this repo with the command line and then run RSpec
```
$ rspec
```
If all tests are green, run the game:
```
$ ruby connect_four.rb
```

## What's inside?

*tl:dr* The first Ruby script that I'm proud to show off, I really got to practice breaking down complex problems into bite-sized parts, and then test those parts to ensure that as I learn more, my code can be refactored.

Firstly, writing this game really helped to understand OOP and TDD principles. My file tree looks like this:

```
  .
  ├── connect_four.rb
  ├── lib
  │   ├── board.rb
  │   ├── game.rb
  │   └── player.rb
  └── spec
      ├── board_spec.rb
      ├── game_spec.rb
      ├── player_spec.rb
      └── spec_helper.rb
```

As you can probably tell, my focus from early on was with the separation of concerns. Each class was contained with it's own file, and each class had it's own test. Speaking of tests, this project was my first experience using doubles like `player1 = double('player')` to ensure that one class' tests aren't dependent on a separate class.

The other very fun part of building this game was writing the `Board#win?` method. I approached this problem a few different ways. The first thing to note is that I used a nested array to represent my board:

```
[['.', '.', '.', '.', '.', '.', '.'],
 ['.', '.', '.', '.', '.', '.', '.'],
 ['.', '.', '.', '.', '.', '.', '.'],
 ['.', '.', '.', '.', '.', '.', '.'],
 ['.', '.', '.', '.', '.', '.', '.'],
 ['O', '.', '.', '.', '.', '.', '.']]
```


So therefore, the position where the `'O'` is located could be indexed as `Board[5][0]` (The first element in the fifth array). When it came time to write a `Board#win` method, I first approached it recursively. I wanted the method to return true or false by following a "flood-fill" methodology. The idea was that when a token was played, those "coordinates" would be passed to `Board#win?`. The base cases would be to `return if count == 4`, meaning that four tokens were found in sequence, and to `return if !row.between?(0, 5) && !column.between?(0, 6)`, meaning that the method was now testing outside of the board's range.<br><br>If the current position on the board was equal to the token, the method would check each position in each direction to see if there was a matching token, if so, it would move in that direction and `count += 1` until either `count == 4` or a matching token was not found. In theory, this would work, and I'm still excited by the prospect of implementing this algorithm, as I think it is suitable, but instead, I settled on a non-recursive strategy:</p>

```
def horizontal_win?(args = {})
  token   = args.fetch(:token, nil)
  row     = args.fetch(:row, nil)
  column  = args.fetch(:column, nil)

  count = 0

  4.times do |i|
    count += 1 if column + i <= 6 && @play_area[row][column + i] == token
    count += 1 if column - i >= 0 && @play_area[row][column - i] == token
    return true if count == 5
  end

  false
end
```

This method was written to check for horizontal wins and similar methods were written to check for diagonal and vertical wins as well. Firstly, this code accepts an `args` array to take the pressure of the method caller to keep track of so many representational numbers. Secondly, the code iterates four times and simply adds one to `count` if token in either direction matches the token that was just played.

I had some weird edge case errors with the code initially, for example, when `column - i` would equal a negative number, the method would then be checking the end of the array, and if their happened to be a matching token on the opposite side, a win would be returned. Luckily testing helped with this!

```
  it 'returns false' do
    board.instance_variable_set(:@play_area,
                                [['.', '.', '.', '.', '.', '.', '.'],
                                 ['.', '.', '.', '.', '.', '.', '.'],
                                 ['.', '.', '.', '.', '.', '.', '.'],
                                 ['.', '.', '.', '.', '.', '.', '.'],
                                 ['.', '.', '.', '.', '.', '.', '.'],
                                 ['O', '.', '.', '.', 'O', 'O', 'O']])
    expect(board.win?(token: 'O', row: 4, column: 0)).to be false
  end
```

This test originally failed.

Overall, this was one of my favorite projects to work on. From end to end, I felt very confident, and now I'm excited to go back and refactor!

## Where do we go from here?

I first wrote this code around November 2016, so looking back at it now gets me excited to refactor. Thanks to POODR, I'm looking to get my hands dirty cleaning this code up before adding features. 

## What did I learn?

TDD with Rspec, some basic OOP principles with some SOLID design, and patience.
