class Vote < ApplicationRecord
  before_save :finish_vote

  belongs_to :user

  def finish_vote
    p = 11
    q = 5
    g = 7
    x = 2 # should be random for each election but this simplifies matters
    g_2 = (g ** x) % p # second generator (g2 in DRE-ip paper)
    ri = 3 # should be random, this simplifies stuff, will need to change later
    self.big_ri = (g_2 ** ri) % p
    self.big_zi = ((g ** ri) % p) * ((g ** self.vote) % p)
    self.status = "Confirmed"
    self.pwf = (self.big_ri == ((g_2 ** ri) % p) && self.big_zi == ((g ** ri) % p)) || (big_ri == ((g_2 ** ri) % p) && self.big_zi.div(g)  == ((g ** ri) % p))
  end
end
