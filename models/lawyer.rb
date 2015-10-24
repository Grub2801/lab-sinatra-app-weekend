class Lawyer < ActiveRecord::Base
  def to_s
    "#{name} (#{qualification_area}) "
  end
end
