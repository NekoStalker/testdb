class Team < ActiveRecord::Base
  belongs_to :champ_racer1 ,class_name: "ChampRacer",foreign_key: "champ_racer1_id",inverse_of: :teams
  belongs_to :champ_racer, class_name: "ChampRacer",foreign_key: "champ_racer_id",inverse_of: :teams
  accepts_nested_attributes_for :champ_racer, allow_destroy: true
  accepts_nested_attributes_for :champ_racer1, allow_destroy: true
  validates :name, presence: true
  validates :engine_prod, presence: true
  #validates :champ_racer_id, presence: true
  #validates :champ_racer1_id, presence: true, uniqueness: { scope: :champ_racer_id,
   # message: "Выберите разных гонщиков" }
  validates :numbr1, presence: true, numericality:
		{ only_integer: true, greater_than_or_equal_to: 0 }
  validates :numbr2, presence: true, numericality:
		{ only_integer: true, greater_than_or_equal_to: 0 }
  validates_uniqueness_of :numbr1, scope: :numbr2
  validates :country, presence: true
end
