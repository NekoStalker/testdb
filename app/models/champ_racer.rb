class ChampRacer < ActiveRecord::Base
  has_many :teams, inverse_of: :champ_racer
  has_many :teams1, class_name: "Team", foreign_key: 'champ_racer1_id', inverse_of: :champ_racer
  validates :fn, presence: true
  validates :sn, presence: true
  validates :b_date, presence: true
  validates :country, presence: true
  validates :win_rate, presence: true, numericality:
		{ only_integer: true, greater_than_or_equal_to: 0 }
  def self.search(params)
    result = ChampRacer.includes(:teams,:teams1).references(:teams,:teams1)
    if params['name'].present?
      result = result.where(teams: {name: params['name']}) + (result.where(teams1s_champ_racers: {name: params['name']}))
    end
    if params['engine_prod'].present?
      result = result.where(teams: {engine_prod: params['engine_prod']})+ (result.where(teams1s_champ_racers: {engine_prod: params['engine_prod']}))
    end
    if params['numbr1'].present?
      result = result.where(teams: {numbr1: params['numbr1']}) + (result.where(teams1s_champ_racers: {numbr1: params['numbr1']}))
    end
    if params['numbr2'].present?
      result = result.where(teams: {numbr2: params['numbr2']}) + (result.where(teams1s_champ_racers: {numbr2: params['numbr2']}))
    end
    if params['country'].present?
      result = result.where(teams: {country: params['country']}) + (result.where(teams1s_champ_racers: {country: params['country']}))
    end
    if params['fn'].present?
      result = result.where(fn: params['fn'])
    end
    if params['sn'].present?
      result = result.where(sn: params['sn'])
    end
    if params['b_date1'].present? and params['b_date2'].present?
      result = result.where("b_date >= ? and b_date <= ?", params['b_date1'], params['b_date2'])
    end
    if params['country'].present?
      result = result.where(country: params['country'])
    end
    if params['win_rate'].present?
      result = result.where(win_rate: params['win_rate'])
    end
    result
  end
end
