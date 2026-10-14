require "./lib/ipaddr"
require "benchmark"

puts RUBY_DESCRIPTION
puts

ipv4 = IPAddr.new("192.0.2.1")
ipv6 = IPAddr.new("2001:db8::1")

n = 1_000_000

puts "# IPAddr#hton"

Benchmark.bmbm do |x|
  x.report("IPAddr#hton_old") do
    n.times { ipv4.hton_old }
    n.times { ipv6.hton_old }
  end
  x.report("IPAddr#hton_new") do
    n.times { ipv4.hton_new }
    n.times { ipv6.hton_new }
  end
end


puts
puts "# IPAddr#reverse"

Benchmark.bmbm do |x|
  x.report("IPAddr#reverse_old") do
    n.times { ipv4.reverse_old }
    n.times { ipv6.reverse_old }
  end
  x.report("IPAddr#reverse_new") do
    n.times { ipv4.reverse_new }
    n.times { ipv6.reverse_new }
  end
end
