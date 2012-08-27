#encoding:UTF-8
module Taurus
  module BaseHelper
    def boolean_hash
      { false => "否", true => "是" }
    end

    def format_boolean(boolean)
      boolean_hash[boolean]
    end

    def components
      coms = Taurus::Function.display.sort_by{ |c| -c["sequence"] }
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

      if request.fullpath.gsub('//', '/') == "/admin"
        coms = Taurus::Function.display.sort_by{ |c| -c["sequence"] }
        coms.each do |com|
          fun_str << content_tag(:li, (link_to com["name"], com["url"]))
        end
      else
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
      end  

      if fun_str.blank?
        nil
      else
        content_tag(:ul, fun_str.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
      end
    end

    def breadcrumb
      li = content_tag(:li, "#{link_to "首页", "/admin"} #{content_tag(:span, "/", :class => "divider")}".html_safe )
      
      if request.fullpath.gsub('//', '/') != "/admin"
        Taurus::Function.all.each do |com|
          if com["functions"]
            com["functions"].each do |fun|
              if request.fullpath.gsub('//', '/').starts_with?(fun["url"])
                li << content_tag(:li, "#{link_to com["name"], com["url"]} #{content_tag(:span, "/", :class => "divider")}".html_safe )
                li << content_tag(:li, "#{link_to fun["name"], fun["url"]}".html_safe )  
                break
              end  
            end
          else
            if request.fullpath.gsub('//', '/').starts_with?(com["url"])
              li << content_tag(:li, "#{link_to com["name"], com["url"]} #{content_tag(:span, "/", :class => "divider")}".html_safe )
              break
            end 
          end
        end
      end
      content_tag(:ul, li.html_safe, :class => "breadcrumb breakcrumb-admin-home")
    end  

    def format_price(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "price")
    end

    def grey_cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "grey_cny")
    end

    def flash_messages
      [:success, :error].map do |msg_type|
        if flash[msg_type]
          content_tag :div, flash[msg_type], :class => "alert alert-#{msg_type.to_s}"
        else
          ''
        end
      end.join("\n").html_safe
    end

    def show_input(object, method, options = {})
      content_tag :div, :class => "control-group" do
        input = content_tag :label, :class => "control-label" do
          I18n.t("activerecord.attributes.#{object.class.to_s.underscore}.#{method.to_s}")
        end
        input += content_tag :div, :class => "controls" do 
          if options[:class] 
            options[:class] << " uneditable-input"
          else
            options[:class] = "uneditable-input"
          end  
          content_tag :span, options do
            if object
              if options[:format]
                options[:format][object.send(method)]
              else
                object.send(method).to_s
              end
            end
          end
        end
      end
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