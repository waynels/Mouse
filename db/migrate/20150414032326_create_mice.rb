class CreateMice < ActiveRecord::Migration
  def change
    create_table :mice do |t|
      t.belongs_to :strain #品系
      t.string :code #编号
      t.string :generation
      t.date :birthday #出生日期
      t.date :wean_date #离乳日期
      t.string :sex #性别
      t.integer :father_id
      t.integer :mother_id
      t.belongs_to :basket #位子
      t.belongs_to :batch #哪一窝
      t.string :life_status
      t.string :coat_color
      t.date :dead_date
      t.date :dead
      t.integer :onwer_id
      t.integer :created_by
      t.boolean :is_dead, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
