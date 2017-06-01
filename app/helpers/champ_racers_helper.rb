module ChampRacersHelper
  def racers_options
      ChampRacer.all.pluck('fn,id')
  end
end
