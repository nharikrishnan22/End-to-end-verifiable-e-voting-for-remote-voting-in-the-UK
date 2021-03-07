require 'ecdsa'
require 'securerandom'
group = ECDSA::Group::Nistp256
f = File.open("g_2", "w") # on it's own this line clears file contents
private_key = 1 + SecureRandom.random_number(group.order - 1)
g2 = (group.generator).multiply_by_scalar(private_key)
encoded = ECDSA::Format::PointOctetString.encode(g2).force_encoding("UTF-8")
f.write(encoded)
f.close()