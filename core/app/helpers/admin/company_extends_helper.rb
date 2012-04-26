module Admin::CompanyExtendsHelper
  def get_company_scale_name(object)
    if object.company_scale_id.nil?
      ""
    else
      object.company_scale.name
    end
  end
end
