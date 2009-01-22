# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{array_stats}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Koski"]
  s.date = %q{2009-01-22}
  s.description = %q{Simple statistics for ruby arrays -- mean, median, sum, and percentile.  For more complex applications, you should consider NArray[http://narray.rubyforge.org/].}
  s.email = ["gems@benkoski.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/array_stats.rb", "lib/array_stats/array_stats.rb", "lib/array_stats/array.rb", "lib/array_stats/float.rb", "script/console", "script/destroy", "script/generate", "test/test_array_stats.rb", "test/test_float_extensions.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://benkoski.com/array_stats/}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{array_stats}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple statistics for ruby arrays -- mean, median, sum, and percentile}
  s.test_files = ["test/test_array_stats.rb", "test/test_float_extensions.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
