class Vote < ApplicationRecord
  before_update :finish_vote_update
  before_create :finish_vote_create

  belongs_to :user
  validates :vote, presence: true
  validates :user_id, uniqueness: true

  group = ECDSA::Group::Nistp256 
  f = File.open("g_2", "r") # g_2 is generated before the election
  @@g2 = ECDSA::Format::PointOctetString.decode(f.read, group)
  f.close()

  def finish_vote_create
    group = ECDSA::Group::Nistp256
    ri = 1 + SecureRandom.random_number(group.order - 1)
    g1_ri = group.generator.multiply_by_scalar(ri)
    big_ri = @@g2.multiply_by_scalar(ri)
    big_zi = 0
    if self.vote == 0
      big_zi = g1_ri # add identity element group.infinity if vote = 0
    else
      big_zi = g1_ri.add_to_point(group.generator)
    end

    # Proof of Well-Formedness
    w = SecureRandom.random_number(group.order)
    if self.vote == 0
      pwf_r_2 = SecureRandom.random_number(group.order)
      pwf_c_2 = SecureRandom.random_number(group.order)

      t_1 = @@g2.multiply_by_scalar(w)
      t_2 = group.generator.multiply_by_scalar(w)
      t_3 = @@g2.multiply_by_scalar(pwf_r_2).add_to_point(big_ri.multiply_by_scalar(pwf_c_2))
      t_4 = group.generator.multiply_by_scalar(pwf_r_2).add_to_point(big_zi.add_to_point(group.generator.negate()).multiply_by_scalar(pwf_c_2))

      c = Digest::SHA256.hexdigest(ECDSA::Format::PointOctetString.encode(@@g2).to_s + ECDSA::Format::PointOctetString.encode(group.generator).to_s + ECDSA::Format::PointOctetString.encode(@@g2).to_s + ECDSA::Format::PointOctetString.encode(group.generator).to_s + ECDSA::Format::PointOctetString.encode(big_ri).to_s + ECDSA::Format::PointOctetString.encode(big_zi).to_s + ECDSA::Format::PointOctetString.encode(t_1).to_s + ECDSA::Format::PointOctetString.encode(t_2).to_s + ECDSA::Format::PointOctetString.encode(t_3).to_s + ECDSA::Format::PointOctetString.encode(t_4).to_s)

      pwf_c_1 = (c.to_i(16) - pwf_c_2) % group.order
      pwf_r_1 = (w - (pwf_c_1 * ri)) % group.order

      self.pwf_c_1 = pwf_c_1.to_s # convert to string to store in database (too large to be stored as integer)
      self.pwf_c_2 = pwf_c_2.to_s # too large to be stored as an integer
      self.pwf_r_1 = pwf_r_1.to_s # too large to be stored as an integer
      self.pwf_r_2 = pwf_r_2.to_s # too large to be stored as an integer
    else
      pwf_r_1 = SecureRandom.random_number(group.order)
      pwf_c_1 = SecureRandom.random_number(group.order)

      t_1 = @@g2.multiply_by_scalar(pwf_r_1).add_to_point(big_ri.multiply_by_scalar(pwf_c_1))
      t_2 = group.generator.multiply_by_scalar(pwf_r_1).add_to_point(big_zi.multiply_by_scalar(pwf_c_1))
      t_3 = @@g2.multiply_by_scalar(w)
      t_4 = group.generator.multiply_by_scalar(w)

      c = Digest::SHA256.hexdigest(ECDSA::Format::PointOctetString.encode(@@g2).to_s + ECDSA::Format::PointOctetString.encode(group.generator).to_s + ECDSA::Format::PointOctetString.encode(@@g2).to_s + ECDSA::Format::PointOctetString.encode(group.generator).to_s + ECDSA::Format::PointOctetString.encode(big_ri).to_s + ECDSA::Format::PointOctetString.encode(big_zi).to_s + ECDSA::Format::PointOctetString.encode(t_1).to_s + ECDSA::Format::PointOctetString.encode(t_2).to_s + ECDSA::Format::PointOctetString.encode(t_3).to_s + ECDSA::Format::PointOctetString.encode(t_4).to_s)

      pwf_c_2 = (c.to_i(16) - pwf_c_1) % group.order
      pwf_r_2 = (w - (pwf_c_2 * ri)) % group.order

      self.pwf_c_1 = pwf_c_1.to_s # convert to string to store in database (too large to be stored as integer)
      self.pwf_c_2 = pwf_c_2.to_s # too large to be stored as an integer
      self.pwf_r_1 = pwf_r_1.to_s # too large to be stored as an integer
      self.pwf_r_2 = pwf_r_2.to_s # too large to be stored as an integer
    end

    self.ri = ri.to_s # convert to string to store in database (too large to be stored as integer)
    self.big_ri = ECDSA::Format::PointOctetString.encode(@@g2.multiply_by_scalar(ri)).force_encoding("UTF-8")
    value = 0
    if self.vote == 0
      value = group.infinity
    else
      value = group.generator
    end
    self.big_zi = ECDSA::Format::PointOctetString.encode(g1_ri.add_to_point(value)).force_encoding("UTF-8")
  end

  def finish_vote_update
    if self.status == "confirmed"
      f = File.open("total_random", "r") # s in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
      f2 = File.open("total_votes", "r") # t in paper. file is created beforehand and is reset to 0 manually when vote is over, don't destroy votes or otherwise things will not work
      current_random = f.read.to_i
      current_votes = f2.read.to_i
      f.close()
      f2.close()
      f = File.open("total_random", "w")
      f2 = File.open("total_votes", "w")
      new_random = current_random + self.ri.to_i
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
