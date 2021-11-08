set :output, 'log/cron.log'
ENV.each { |k, v| env(k, v) }

every 1.day, at: '3:35 am' do
  runner 'UserImportService.perform'
end
