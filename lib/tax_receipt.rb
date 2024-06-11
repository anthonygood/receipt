require 'tax_receipt/creator'

path_or_input = ARGV[0]

if (!path_or_input || path_or_input.empty?)
  puts "Please provide a file path"
  exit 1
end

input = if (File.exist?(path_or_input))
  File.read(path_or_input)
else
  path_or_input
end

puts TaxReceipt::Creator.create(input)
