require 'benchmark/ips'
a = [['C', 14], ['A', 3], ['B', 5], ['E', 50], ['D', 23]]
Benchmark.ips do |x|
  x.report("a=a.sort")  {  a=a.sort }
  x.report("a.sort!")  {  a.sort!  }
  x.compare!
end