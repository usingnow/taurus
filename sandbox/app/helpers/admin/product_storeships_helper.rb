module Admin::ProductStoreshipsHelper
  def product_stores(product)
    stores = Store.all

    result = ''

    stores.each do |store|
     flag = false

     product.product_storeships.each do |product_store|
       if product_store.store_id == store.id
          flag = true
       end
     end

     if flag == true
       result += "<div class='field'><input type='checkbox' name='store_id[]' checked='checked' value='#{store.id}'/>#{store.name}</div>"
     else
       result += "<div class='field'><input type='checkbox' name='store_id[]' value='#{store.id}'/>#{store.name}</div>"
     end
   end

   result
  end
end
