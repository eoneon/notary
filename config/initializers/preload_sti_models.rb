if Rails.env.development?
  %w[job piecemeal_job].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end