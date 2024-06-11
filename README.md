## Run the tests
```sh
bundle install --binstubs
bin/rspec --format=documentation
```

## Run the app
Execute `lib/tax_receipt.rb` passing a filepath to your input, or the input itself:
```sh
# With a filepath
exe/receipt spec/fixtures/input_1.txt

# Input directly from command-line (note that newlines must be preserved)
exe/receipt "1 imported box of chocolates at 10.00                 
1 imported bottle of perfume at 47.50"
```
There's no validation on the input, so you can get some mangled output by eg. passing the example output as input, or a non-existent filepath.

## Assumptions

I'm using Ruby version `2.6.10p210` because that's what's installed on my machine, I assume the code works as expected on more recent Ruby versions or that you can use something like RVM to run with 2.6.10.

I've also assumed the disparity between example three's input and output is unintentional ("3 imported boxes" vs "3 imported box") and assert that the input's item description prevails.
