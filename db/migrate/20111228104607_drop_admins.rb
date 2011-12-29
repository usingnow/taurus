class DropAdmins < ActiveRecord::Migration
  def self.up
    drop_table :admins
  end

  def self.down
    create_table :admins do |t|       #管理员表
      t.string :login_no                #帐号
      t.string :password                #密码
      t.integer :status                 #是否激活
      t.string :question                #找回密码问题
      t.string :answer                  #找回密码答案
      t.datetime :last_login_time       #最后登录时间
      t.string :email                   #邮箱
      t.integer :sex                    #性别
      t.string :name                    #姓名
      t.string :address                 #地址
      t.string :phone                   #电话
      t.string :fax                     #传真
      t.string :mobile                  #手机
      t.string :post                    #邮编

      t.timestamps
    end
  end
end
