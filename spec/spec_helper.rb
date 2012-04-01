def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def stub_uri(method, url, filename)
  options = { :body => fixture_file(filename), :content_type => 'application/json' }
  url = "https://quote.fm/api"+url.to_s
  FakeWeb.register_uri(method.to_sym, url, options)
end