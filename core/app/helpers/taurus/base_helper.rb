#encoding:UTF-8
module Taurus
  module BaseHelper
    def format_boolean(boolean)
      { false => "否", true => "是" }[boolean]
    end

    def get_district_select_options
      Province.all(:order=>'number').collect{|item|[item.name,item.number]}.insert(0,["请选择..",nil])
    end

    def functions
      data = Taurus::Function.all
      fun_str = ""
      data.each do |com|
        com['functions'].each_with_index do |fun,index|
          if index == 0
            fun_str += content_tag(:li, com['name'], :class => "nav-header")
            fun_str += content_tag(:li, '', :class => 'divider')
          end
          fun_str += content_tag(:li, (link_to fun['name'], fun['url']))    
        end
      end
      content_tag(:ul, fun_str.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
    end

    def order_indicator_for(order)
      if order == 'asc'
        '&uarr;'
      elsif order == 'desc'
        '&darr;'
      else
        nil
      end
    end

    def cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "cny")
    end

    def grey_cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "grey_cny")
    end

    def area(object)
      object.district ? object.district.address : ""
    end
    
    def error_messages(object)
      if object.errors.any?
        h2 = content_tag(:h2, I18n.t('activerecord.errors.template.header.default'))
        li = ''
        object.errors.full_messages.each do |msg|
          li += content_tag(:li, msg)
        end
        ul = content_tag(:ul, li.html_safe)
        content_tag(:div, h2+ul, :id => "error_explanation").html_safe
      end
    end

    def symbol_label(content,options={})
      label_tag "", content+"：", options
    end

    private

      def format_value(value,hash)
        hash[value] ||= "无"
      end
  end
end