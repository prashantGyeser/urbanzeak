CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIH5AYAB4PIP7FCUA',       # required
      :aws_secret_access_key  => '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', # required
  }
  config.fog_directory  = 'urbanzeak'                     # required
end