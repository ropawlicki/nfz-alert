# frozen_string_literal: true

module ApplicationHelper
  def format_to_postgresql_timestamp(datetime)
    datetime.strftime('%Y-%m-%d %H:%M:%S.%6N')
  end
end
