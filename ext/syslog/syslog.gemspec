
source_version = ["", "ext/syslog/"].find do |dir|
  begin
    break File.open(File.join(__dir__, "#{dir}syslog.c")) {|f|
      f.gets("\n#define SYSLOG_VERSION ")
      f.gets[/\s*"(.+)"/, 1]
    }
  rescue Errno::ENOENT
  end
end

Gem::Specification.new do |spec|
  spec.name          = "syslog"
  spec.version       = source_version
  spec.authors       = ["Akinori MUSHA"]
  spec.email         = ["knu@idaemons.org"]

  spec.summary       = %q{Ruby interface for the POSIX system logging facility.}
  spec.description   = %q{Ruby interface for the POSIX system logging facility.}
  spec.homepage      = "https://github.com/ruby/syslog"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  spec.licenses      = ["Ruby", "BSD-2-Clause"]

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.extensions    = ["ext/syslog/extconf.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
