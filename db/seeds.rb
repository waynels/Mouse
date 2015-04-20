#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#5.times do |k|
#  10.times do |i|
#    10.times do |j|
#      basket = Basket.create(code: "#{k+1}-#{i+1}#{(j+65).chr}")
#    end
#  end
#end

#file = File.open("/Users/mac/Desktop/小鼠总计.txt")
#lines = file.readlines
#lines = lines[0].split("\r")
#p lines
#lines.each do |line|
#  arr = []
#  arr = line.split(";")
#  basket = "#{arr[0]}"+"-"+"#{arr[1]}"
#  strain = arr[2]
#  if strain == ""
#    strain = nil
#  end
#  generate_num = arr[3]
#  if generate_num == ""
#    generate_num = nil
#  end
#  birthday = arr[4]
#  if birthday == ""
#    birthday = nil
#  end
#  weaningday = arr[5]
#  if weaningday == ""
#    weaningday = nil
#  end
#  gender = arr[8]
#  if gender == ""
#    gender = nil
#  end
#  code = arr[9]
#  if code == "" 
#    code = nil
#  end
#  identification = arr[10]
#  if identification == nil
#    identification = nil
#  end
#  gfp = arr[11]
#  if gfp == nil
#    gfp = nil
#  else
#    gfp = gfp.to_f
#  end
#  gfp_val = arr[12]
#  if gfp_val == ""
#    gfp_val = nil
#  else
#    gfp_val = gfp_val.to_f
#  end
#  p arr
#  if arr[13] == nil or arr[13] == ""
#    father_code = nil 
#    mother_code = nil 
#  else
#  parents = arr[13].split("+")
#  if parents[0][-1] == "F" or parents[0][-1] == "M"
#    father_code = parents[0][0..-2]
#  else
#    father_code = parents[0]
#  end
#  if parents[1][-1] == "F" or parents[1][-1] == "M"
#    mother_code = parents[1][0..-2]
#  else
#    mother_code = parents[1]
#  end
#  end
#  b = Basket.where(code: basket).first
#  s = nil
#  if strain == nil
#    mouse = Mouse.create(basket_id: b.id,strain_id: 8, generate_num: generate_num, birthday: birthday, weaningday: weaningday, gender: gender, code: code, identification: identification, gfp: gfp, gfp_val: gfp_val, father_code: father_code, mother_code: mother_code)
#  else
#    if Strain.where(name: strain) == nil or Strain.where(name: strain) == []
#      s = Strain.create(name: strain)
#    else
#      s = Strain.where(name: strain).first
#    end
#    mouse = Mouse.create(basket_id: b.id,strain_id: s.id, generate_num: generate_num, birthday: birthday, weaningday: weaningday, gender: gender, code: code, identification: identification, gfp: gfp, gfp_val: gfp_val, father_code: father_code, mother_code: mother_code)
#    p mouse
#  end
#end
#

mice = Mouse.all
mice.each do |mouse|
  if mouse.father_code
    father = Mouse.where(code: mouse.father_code).first
    if father
      mouse.father_id = father.id
    else
      mouse.father_id = Mouse.where(:strain_id => 8, :gender => "M").first.id
    end
  end
  if mouse.mother_code
    mother = Mouse.where(code: mouse.mother_code).first
    if mother
      mouse.mother_id = mother.id
    else
      mouse.mother_id = Mouse.where(:strain_id => 8, :gender => "F").first.id
    end
  end
  mouse.save
  p "#{mouse.id}--#{mouse.father_id}--#{mouse.mother_id}"
end
