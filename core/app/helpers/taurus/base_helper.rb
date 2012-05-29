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
        if component["id"] == com["id"]
          li << content_tag(:li, (link_to com["name"], com["url"]), :class => "active")
        else
          li << content_tag(:li, (link_to com["name"], com["url"]))
        end
      end
      content_tag(:ul, li.html_safe, :class => "nav")    
    end

    def functions
      fun_str = ""
      component['functions'].each_with_index do |fun,index|
        if index == 0
          fun_str += content_tag(:li, component['name'], :class => "nav-header")
          fun_str += content_tag(:li, '', :class => 'divider')
        end
        if request.fullpath.gsub('//', '/').starts_with?(fun["url"])
          fun_str += content_tag(:li, (link_to fun['name'], fun['url']), :class => "active") 
        else  
          fun_str += content_tag(:li, (link_to fun['name'], fun['url'])) 
        end     
      end if component['functions']
      content_tag(:ul, fun_str.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
    end

    def breadcrumb
      li = content_tag(:li, "#{link_to "首页", "/admin"} #{content_tag(:span, "/", :class => "divider")}".html_safe )
      
      if request.fullpath.gsub('//', '/') != "/admin"
        Taurus::Function.all.each do |com|
          if request.fullpath.gsub('//', '/').starts_with?(com["url"])
            li << content_tag(:li, "#{link_to com["name"], com["url"]} #{content_tag(:span, "/", :class => "divider")}".html_safe )
            
            com["functions"].each do |fun|
              if request.fullpath.gsub('//', '/').starts_with?(fun["url"])
                li << content_tag(:li, "#{link_to fun["name"], fun["url"]}".html_safe )  
                break
              end  
            end if com["functions"]
          end
        end
      end
      content_tag(:ul, li.html_safe, :class => "breadcrumb breakcrumb-admin-home")
    end  

    def format_price(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "cny")
    end

    def grey_cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "grey_cny")
    end

    def flash_messages
      [:notice, :error].map do |msg_type|
        if flash[msg_type]
          content_tag :div, flash[msg_type], :class => "alert alert-success"
        else
          ''
        end
      end.join("\n").html_safe
    end

    protected
    def component
      Function.all.each do |com|
        if request.fullpath.gsub('//', '/').starts_with?(com["url"])
          return com 
        end
        com['functions'].each do |fun|
          if request.fullpath.gsub('//', '/').starts_with?(fun["url"])
            return com 
          end
        end if com['functions']
      end if request.fullpath.gsub('//', '/') != "/admin"
      Hash.new
    end

  end
end