#encoding:UTF-8
class AddAdjustmentPermission < ActiveRecord::Migration
  def self.up
    execute("update operatings set name = '查询', action = 'read' where id = 20 ")
    execute("insert into operatings(function_id,name,action,subject_class) values(17,'修改','update','Order')")
    execute("insert into operatings(function_id,name,action,subject_class) values(17,'新建','create','Order')")
    execute("insert into operatings(function_id,name,action,subject_class) values(17,'调整运费','carriage_adjustment','Order')")
    execute("insert into operatings(function_id,name,action,subject_class) values(17,'其他费用','other_cost','Order')")
  end

  def self.down
    execute("update operatings set name = '管理', action = 'manage' where id = 20 ")
    execute("delete from operatings where function_id = 17 and id != 20 ")
  end
end
