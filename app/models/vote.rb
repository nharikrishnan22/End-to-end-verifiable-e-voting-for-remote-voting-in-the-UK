class Vote < ApplicationRecord
  before_update :finish_vote_update
  before_create :finish_vote_create

  belongs_to :user
  validates :vote, presence: true
  validates :user_id, uniqueness: true

  def finish_vote_create
    g = 2130 
    p = 17278829
    q = 32479
    g_2 = 4536900 # second generator (g2 in DRE-ip paper), should ideally be generated randomly
    ri = SecureRandom.random_number(1..q-1)
    f = File.open("total_random", "r") # s in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
    f2 = File.open("total_votes", "r") # t in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
    self.big_ri = (g_2 ** ri) % p
    self.big_zi = ((g ** ri) % p) * ((g ** self.vote) % p)
    self.pwf = (self.big_ri == ((g_2 ** ri) % p) && self.big_zi == ((g ** ri) % p)) || (big_ri == ((g_2 ** ri) % p) && self.big_zi.div(g)  == ((g ** ri) % p))
    if self.status == "audited"
      self.ri = ri
    elsif self.status == "confirmed"
      current_random = f.read.to_i
      current_votes = f2.read.to_i
      f.close()
      f2.close()
      f = File.open("total_random", "w")
      f2 = File.open("total_votes", "w")
      new_random = current_random + ri
      new_votes = current_votes + self.vote
      f.write(new_random)
      f2.write(new_votes)
      f.close()
      f2.close()
      self.vote = "" # make empty so vote cannot be traced to user
    else
      self.ri = ri
    end
  end

  def finish_vote_update
    g = 2130 
    p = 17278829
    q = 32479
    g_2 = 4536900 # second generator (g2 in DRE-ip paper), should ideally be generated randomly
    f = File.open("total_random", "r") # s in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
    f2 = File.open("total_votes", "r") # t in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
    self.big_ri = (g_2 ** self.ri) % p
    self.big_zi = ((g ** self.ri) % p) * ((g ** self.vote) % p)
    self.pwf = (self.big_ri == ((g_2 ** self.ri) % p) && self.big_zi == ((g ** self.ri) % p)) || (big_ri == ((g_2 ** ri) % p) && self.big_zi.div(g)  == ((g ** self.ri) % p))
    if self.status == "confirmed"
      current_random = f.read.to_i
      current_votes = f2.read.to_i
      f.close()
      f2.close()
      f = File.open("total_random", "w")
      f2 = File.open("total_votes", "w")
      new_random = current_random + ri
      new_votes = current_votes + self.vote
      f.write(new_random)
      f2.write(new_votes)
      f.close()
      f2.close()
      self.ri = ""
      self.vote = "" # make empty so vote cannot be traced to user
    end
  end
end
