FITBIT_DEFAULT_SCOPE = %w[
  activity
  cardio_fitness
  electrocardiogram
  heartrate
  irregular_rhythm_notifications
  location
  nutrition
  oxygen_saturation
  profile
  respiratory_rate
  settings
  sleep
  social
  temperature
  weight
].join(' ')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :fitbit, ENV['FITBIT_KEY'], ENV['FITBIT_SECRET'], scope: FITBIT_DEFAULT_SCOPE
end
