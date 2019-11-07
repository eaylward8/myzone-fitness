# frozen_string_literal: true

module AthletesHelper
  def bg_class(idx)
    return 'has-background-danger' if idx == 7
    return 'has-background-grey-lighter' if idx == 3
    return 'has-background-success' if idx < 3

    'has-background-warning' if idx > 3
  end

  def standings_icon(idx)
    return content_tag(:i, nil, class: 'fas fa-user-graduate') if idx == 7
    return content_tag(:i, nil, class: 'fas fa-dollar-sign fa-sm') * (3 - idx) if idx < 3

    content_tag(:i, nil, class: 'fas fa-dollar-sign fa-sm has-text-danger') * (idx - 3) if idx > 3
  end

  def points_per_day(points)
    days = (Time.zone.today - Athlete::CHALLENGE_START).to_f
    (points / days).round
  end

  def times_normal(pts)
    (pts / 1300.0).round(2)
  end

  def next_refresh
    # UTC implementation
    # hour = Time.zone.now.hour
    # return '10AM EST' if (3..14).include? hour
    # return '2PM EST' if (15..18).include? hour
    # return '6PM EST' if (19..22).include? hour
    # '10PM EST'

    hour = Time.zone.now.in_time_zone('Eastern Time (US & Canada)').hour
    return '2PM EST' if (10..13).include? hour
    return '6PM EST' if (14..17).include? hour
    return '10PM EST' if (18..21).include? hour

    '10AM EST'
  end
end
