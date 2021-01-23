class Vote < ApplicationRecord
  before_save :finish_vote

  belongs_to :user

  def finish_vote
    p = 11
    q = 5
    g = 7
    x = SecureRandom.random_number(1..q-1)
    g_2 = (g ** x) % p # second generator (g2 in DRE-ip paper)
    ri = SecureRandom.random_number(1..q-1) # generate ri in Zq
    self.big_ri = (g_2 ** ri) % p
    self.big_zi = ((g ** ri) % p) * ((g ** self.vote) % p)
    self.status = "Confirmed"
    self.pwf = (self.big_ri == ((g_2 ** ri) % p) && self.big_zi == ((g ** ri) % p)) || (big_ri == ((g_2 ** ri) % p) && self.big_zi.div(g)  == ((g ** ri) % p))
    self.vote = 0 # vote reset after voting to preserve anonymity
  end
end
