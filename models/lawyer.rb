class Lawyer < ActiveRecord::Base
  def to_s
    "#{name} (#{qualification_area}) (#{qualification_year}) (#{company}) (#{location}) (#{phone})"
  end
end
