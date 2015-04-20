class CreateMice < ActiveRecord::Migration
  def change
    create_table :mice do |t|
      t.belongs_to :strain #品系
      t.string :code #编号
      t.string :generate_num
      t.date :birthday #出生日期
      t.date :weaningday #离乳日期
      t.string :gender #性别
      t.integer :father_id
      t.string :father_code
      t.integer :mother_id
      t.string :mother_code
      t.belongs_to :basket #位子
      t.belongs_to :batche #哪一窝
      t.string :identification #鉴定结果
      t.decimal :gfp, :precision => 8, :scale => 2 #荧光表达阳性率
      t.decimal :gfp_val, :precision => 8, :scale => 2  #阳性细胞平均荧光强度

      t.timestamps null: false
    end
  end
end
