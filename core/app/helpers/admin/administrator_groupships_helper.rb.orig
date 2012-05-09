module Admin::AdministratorGroupshipsHelper
  def administrator_group(ships)
   groups = Group.all

   result = ''

   groups.each do |group|
     flag = false

     ships.each do |ship|
       if ship.group_id == group.id
          flag = true
       end
     end

     if flag == true
       result += "<label class='checkbox'><input type='checkbox' name='group_id[]' checked='checked' value='#{group.id}'/>#{group.name}</label>"
     else
       result += "<label class='checkbox'><input type='checkbox' name='group_id[]' value='#{group.id}'/>#{group.name}</label>"
     end
   end

   result
  end
end
