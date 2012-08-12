class Initial < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :title
      t.string :url
    end

    create_table :ingredients do |t|
      t.integer :quantity
      t.string :unit
      t.string :name
      t.string :note
      t.references :recipe
    end

    create_table :steps do |t|
      t.string :description
      t.integer :ordinal
      t.references :recipe
    end

    create_table :inventory_items do |t|
      t.string :name
      t.string :brand
      t.integer :qty
      t.string :unit
      t.boolean :is_standard
      t.boolean :is_present
    end

    create_table :recipe_inventory_items do |t|
      t.references :ingredients
      t.references :inventory_item
    end
  end

  def down
    drop_table :recipes
    drop_table :ingredients
    drop_table :steps
    drop_table :inventory_items
    drop_table :recipe_inventory_items
  end
end
