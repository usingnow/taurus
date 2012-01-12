class RenameSliderBarsToPickUps < ActiveRecord::Migration
  def self.up
    rename_table :pick_ups, :slider_bars
  end

  def self.down
    rename_table :slider_bars, :pick_ups
  end
end
