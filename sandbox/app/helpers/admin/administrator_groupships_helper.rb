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
       result += "<div class='field'><input type='checkbox' name='group_id[]' checked='checked' value='#{group.id}'/>#{group.name}</div>"
     else
       result += "<div class='field'><input type='checkbox' name='group_id[]' value='#{group.id}'/>#{group.name}</div>"
     end
   end

   result
  end
end
