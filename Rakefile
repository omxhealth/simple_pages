require 'rake'
require 'spec/rake/spectask'

desc "Run all specs with RCov"
Spec::Rake::SpecTask.new('rcov') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.spec_opts << '--format progress --color'
  t.rcov_opts << '--exclude spec,gems,init.rb'
  t.rcov_opts << '--text-report'
end
  
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/**/*_spec.rb')
  t.spec_opts << '--format specdoc --color --drb'
end