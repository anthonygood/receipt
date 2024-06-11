## Run the tests
```
bundle install --binstubs
bin/rspec
```

## Run the app
Execute `lib/tax_receipt.rb` passing a filepath to your input, or the input itself:
```
# With a filepath
RUBYLIB=lib ruby lib/tax_receipt.rb spec/fixtures/input_1.txt

# Echoing a sub-shell
RUBYLIB=lib ruby lib/tax_receipt.rb $(echo spec/fixtures/input_2.txt)

# Input directly from command-line
RUBYLIB=lib ruby lib/tax_receipt.rb "1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25"
```
There's no validation on the input, so you can get some mangled output by eg. passing the example output as input, or a non-existent filepath.

## Assumptions

I'm using Ruby version `2.6.10p210` because that's what's installed on my machine, I assume the code works as expected on more recent Ruby versions or that you can use something like RVM to run with 2.6.10.

I've also assumed the disparity between example three's input and output is unintentional ("3 imported boxes" vs "3 imported box") and assert that the input's item description prevails.
