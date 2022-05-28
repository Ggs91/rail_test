# frozen_string_literal: true

require 'time'

RSpec.describe Utils::TimeUtils do

  describe '#duration_in_seconds_between' do
    context 'when times without timezone offsets' do
      let(:time_1) { '2020-01-20T19:20:00' }
      let(:time_2) { '2020-01-20T20:20:00' }

      it { expect(subject.duration_in_seconds_between(time_1, time_2) ).to eq(3_600) }
    end

    context 'when times with timezone offsets' do
      let(:time_1) { '2020-01-20T20:20:00+01:00' }
      let(:time_2) { '2020-01-20T20:20:00+02:00' }

      it { expect(subject.duration_in_seconds_between(time_1, time_2)).to eq(3_600) }
    end
  end

  describe '#format_in_hours_minutes' do
    context 'when only minutes' do
      let(:duration_time_in_seconds) { 1_800 }

      it { expect(subject.format_in_hours_minutes(duration_time_in_seconds)).to eq('00:30') }
    end

    context 'when hours & minutes' do
      let(:duration_time_in_seconds) { 5_400 }

      it { expect(subject.format_in_hours_minutes(duration_time_in_seconds)).to eq('01:30') }
    end
  end
end
