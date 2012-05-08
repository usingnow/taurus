module Admin::ProcedureRoleshipsHelper
  #显示所有流程，并为该角色已有流程打勾
  def procedure_role(procedure_roleships)
   procedures = Procedure.all

   result = ''

   procedures.each do |procedure|
     flag = false

     procedure_roleships.each do |procedure_roleship|
       if procedure_roleship.procedure_id == procedure.id
          flag = true
       end
     end

     if flag == true
       result += "<label class='checkbox'><input type='checkbox' name='procedure_id[]' checked='checked' value='#{procedure.id}'/>#{procedure.name}</label>"
     else
       result += "<label class='checkbox'><input type='checkbox' name='procedure_id[]' value='#{procedure.id}'/>#{procedure.name}</label>"
     end
   end

   result
  end
end
