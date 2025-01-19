module Provider
  LIST = %i[
    github
    fitbit
  ].tap do |ary|
    if Rails.env.development?
      ary.unshift('developer')
    end
  end.freeze()
end
