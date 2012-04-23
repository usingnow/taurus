#encoding:UTF-8
require 'spec_helper'

describe Commodity::CategoriesController do

  it "调用 oa_pc 成功" do
    get :oa_pc
  end

  it "调用 office 成功" do
    get :office
  end

  it "调用 daily 成功" do
    get :daily
  end

  it "调用 off_fur 成功" do
    get :off_fur
  end

  it "调用 liv_fur 成功" do
    get :liv_fur
  end

  it "调用 fur_jew 成功" do
    get :fur_jew
  end

end