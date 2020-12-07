# frozen_string_literal: true

class ProvinceDecoder
  def self.call(query_id)
    ProvinceCode.find_by_code(query_id).name
  end
end
