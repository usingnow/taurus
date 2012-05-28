#encoding:UTF-8
module Taurus
  module BaseHelper
    def format_boolean(boolean)
      { false => "否", true => "是" }[boolean]
    end

    def components
      coms = Taurus::Function.all.sort_by{ |c| -c["sequence"] }
      li = ''
      coms.each do |com|
        if session[:component]["id"] == com["id"]
          li << content_tag(:li, (link_to com["name"], com["url"]), :class => "active")
        else
          li << content_tag(:li, (link_to com["name"], com["url"]))
        end  
      end
      content_tag(:ul, li.html_safe, :class => "nav")    
    end

    def functions
      fun_str = ""
      session[:component]['functions'].each_with_index do |fun,index|
        if index == 0
          fun_str += content_tag(:li, session[:component]['name'], :class => "nav-header")
          fun_str += content_tag(:li, '', :class => 'divider')
        end
        if request.fullpath.gsub('//', '/').starts_with?(fun["url"])
          fun_str += content_tag(:li, (link_to fun['name'], fun['url']), :class => "active") 
        else  
          fun_str += content_tag(:li, (link_to fun['name'], fun['url'])) 
        end     
      end
      content_tag(:ul, fun_str.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
    end

    def breadcrumb
      li = content_tag(:li, "#{link_to "首页", "/admin"} #{content_tag(:span, "/", :class => "divider")}".html_safe )
      
      component, function = {}, {}
      if request.fullpath.gsub('//', '/') == "/admin"
        li << content_tag(:li, "控制台".html_safe )
      else
        Taurus::Function.all.each do |com|
          com["functions"].each do |fun|
            if request.fullpath.gsub('//', '/').starts_with?(fun["url"]) && fun["url"] != "/admin"
              function = fun
              component = com
              break
            end  
          end
        end
        li << content_tag(:li, "#{link_to component["name"], component["url"]} #{content_tag(:span, "/", :class => "divider")}".html_safe )
        li << content_tag(:li, "#{link_to function["name"], function["url"]}".html_safe )
      end  
      
      content_tag(:ul, li.html_safe, :class => "breadcrumb breakcrumb-admin-home")
    end  

    def format_price(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "cny")
    end

    def grey_cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "grey_cny")
    end

    def success
      content_tag :div, flash[:notice], :class => "alert alert-success" if flash[:notice]
    end

    
  end
end