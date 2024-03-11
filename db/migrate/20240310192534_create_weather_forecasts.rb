class CreateWeatherForecasts < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:weather_forecasts)
      create_table :weather_forecasts do |t|
        t.references :location, null: false, foreign_key: true
        t.integer :high_temperature
        t.integer :low_temperature
        t.date :date

        t.timestamps
      end
    end
  end
end
