class Signup < ActiveRecord::Base
  attr_accessible :game_id, :nation_id, :password, :status, :player_id
  validates_presence_of :game_id
  validates_presence_of :nation_id
  validates_presence_of :player_id
  belongs_to :game
  belongs_to :player
  validates :nation_id, :uniqueness => {:scope => :game_id,
   :message => "each nation can only have 1 signup per game"}
  validates :game_id, :numericality => { :only_integer => true}
  validates :nation_id, :numericality => { :only_integer => true, :greater_than => -1, :less_than => 100 }
  validates :player_id, :numericality => { :only_integer => true, :greater_than => -1 }
  validates :password, :presence => true, :if => :passwordRequired?

  def passwordRequired?
  	game.requires_passwords
  end
end
