#encoding: utf-8
require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "admin must not be empty" do
    admin = Admin.new
    assert admin.invalid?
  end

  test "login_no must not be blank" do
    admin = Admin.new(:password=>"123456",
                      :status=>"1",
                      :question=>"问题",
                      :answer=>"答案",
                      :email=>"1_a@123.com",
                      :sex=>"1",
                      :name=>"sean",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "不能为空字符",
    admin.errors[:login_no].join('; ')

    admin.login_no="sean"
    assert admin.valid?
  end

  test "password must not be blank" do
    admin = Admin.new(:login_no=>"admin",
                      :status=>"1",
                      :question=>"问题",
                      :answer=>"答案",
                      :email=>"1_a@123.com",
                      :sex=>"1",
                      :name=>"sean",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "不能为空字符",
    admin.errors[:password].join('; ')

    admin.password="123456"
    assert admin.valid?
  end

  test "question must not be blank" do
    admin = Admin.new(:login_no=>"admin",
                      :password=>"123456",
                      :status=>"1",
                      :answer=>"答案",
                      :email=>"1_a@123.com",
                      :sex=>"1",
                      :name=>"sean",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "不能为空字符",
    admin.errors[:question].join('; ')

    admin.question="问题"
    assert admin.valid?
  end

  test "answer must not be blank" do
    admin = Admin.new(:login_no=>"admin",
                      :password=>"123456",
                      :status=>"1",
                      :question=>"问题",
                      :email=>"1_a@123.com",
                      :sex=>"1",
                      :name=>"sean",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "不能为空字符",
    admin.errors[:answer].join('; ')

    admin.answer="答案"
    assert admin.valid?
  end

  test "name must not be blank" do
    admin = Admin.new(:login_no=>"admin",
                      :password=>"123456",
                      :status=>"1",
                      :question=>"问题",
                      :answer=>"答案",
                      :email=>"1_a@123.com",
                      :sex=>"1",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "不能为空字符",
    admin.errors[:name].join('; ')

    admin.name="sean"
    assert admin.valid?
  end

  test "positive email" do
    admin = Admin.new(:login_no=>"admin",
                      :password=>"123456",
                      :status=>"1",
                      :question=>"问题",
                      :answer=>"答案",
                      :name=>"sean",
                      :sex=>"1",
                      :address=>"上海",
                      :phone=>"12345678",
                      :fax=>"123456789",
                      :mobile=>"13012345678",
                      :post=>"150001")

    assert admin.invalid?
    assert_equal "格式错误",
    admin.errors[:email].join(';')

    admin.email = "123afasdf@"
    assert_equal "格式错误",
    admin.errors[:email].join(';')

    admin.email = "123@123.com"
    assert admin.valid?


  end

end
