# frozen_string_literal: true

require 'time'

module Utils
  module TimeUtils
    def duration_in_seconds_between(date_1_with_offset, date_2_with_offset)
      start_date = Time.parse(date_1_with_offset).utc
      end_date   = Time.parse(date_2_with_offset).utc

      (end_date - start_date).abs.to_i
    end

    def format_in_hours_minutes(duration_time_in_seconds)
      Time.at(duration_time_in_seconds).utc.strftime("%H:%M")
    end

    module_function :duration_in_seconds_between
    module_function :format_in_hours_minutes
  end
end
