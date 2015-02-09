class Setup < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :email
      t.string  :password_hash
      t.string  :user_type
      t.timestamps

    end

    create_table :products do |t|
      t.string  :name
      t.string  :image
      t.text    :description
      t.integer :category_id
      t.integer :order_id
      t.integer :price
      t.timestamps
    end

    create_table :categories do |t|
      t.string  :name
      t.timestamps

    end

    create_table :orders do |t|
      t.integer :user_id
      t.timestamps
    end

    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id
    end
  end
end
