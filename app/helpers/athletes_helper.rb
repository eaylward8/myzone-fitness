# frozen_string_literal: true

module AthletesHelper
  def bg_class(idx)
    return 'has-background-danger' if idx == 7
    return 'has-background-success' if idx < 3

    'has-background-warning' if idx > 3
  end

  def standings_icon(idx)
    return content_tag(:i, nil, class: 'fas fa-user-graduate') if idx == 7
    return content_tag(:i, nil, class: 'fas fa-dollar-sign fa-sm') * (3 - idx) if idx < 3

    content_tag(:i, nil, class: 'fas fa-dollar-sign fa-sm has-text-danger') * (idx - 3) if idx > 3
  end
end
