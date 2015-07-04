module BasketsHelper
  def find_male_mouse(basket)
    if basket.use_type == "B"
      if basket.mice.find_by_gender("M")
        true
      else
        false
      end
    else
      false
    end
    
  end
  def query_breed_is_usable(mouse) 
    breed = Breed.where(mother_id: mouse.id).last
    if breed
      true
    else
      false
    end
  end

end
