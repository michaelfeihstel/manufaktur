class RenameColumnsInSeries < ActiveRecord::Migration
  def change
    rename_column :series, :us1, :g1
    rename_column :series, :us1h, :g1h
    rename_column :series, :us2, :g2
    rename_column :series, :us2h, :g2h
    rename_column :series, :us3, :g3
    rename_column :series, :us3h, :g3h
    rename_column :series, :us4, :g4
    rename_column :series, :us4h, :g4h
    rename_column :series, :us5, :g5
    rename_column :series, :us5h, :g5h
    rename_column :series, :us6, :g6
    rename_column :series, :us6h, :g6h
    rename_column :series, :us7, :g7
    rename_column :series, :us7h, :g7h
    rename_column :series, :us8, :g8
    rename_column :series, :us8h, :g8h
    rename_column :series, :us9, :g9
    rename_column :series, :us9h, :g9h
    rename_column :series, :us10, :g10
    rename_column :series, :us10h, :g10h
    rename_column :series, :us11, :g11
    rename_column :series, :us11h, :g11h
    rename_column :series, :us12, :g12
    rename_column :series, :us12h, :g12h
    rename_column :series, :us13, :g13
    rename_column :series, :us13h, :g13h
    rename_column :series, :us14, :g14
    rename_column :series, :us14h, :g14h
    rename_column :series, :us15, :g15
    rename_column :series, :us16, :g16
  end
end
