class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
    t.references       :order,           null:false, foreign_key: true 
    t.string           :postal_code,        null:false                    
    t.integer          :delivery_id,        null:false                    
    t.string           :municipality,       null:false                    
    t.string           :address,            null:false                    
    t.string           :building_name      
    t.string           :phone_number,       null:false                
    t.timestamps
    end
  end
end
