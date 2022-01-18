function vs
  set filename $argv[-1]
  vi $argv[1..-2] --startuptime nvim.log $filename
  vi nvim.log
  rm -f nvim.log
end
