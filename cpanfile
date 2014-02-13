requires "CPAN::DistnameInfo" => "0";
requires "Carp" => "0";
requires "Data::GUID" => "0";
requires "Getopt::Long" => "0";
requires "IO::Prompt::Tiny" => "0";
requires "JSON" => "2";
requires "Pod::Usage" => "0";
requires "overload" => "0";
requires "perl" => "5.006";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Cwd" => "0";
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "File::Spec::Functions" => "0";
  requires "File::Temp" => "0.20";
  requires "List::Util" => "0";
  requires "Test::Fatal" => "0";
  requires "Test::More" => "0.88";
  requires "lib" => "0";
  requires "version" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "0";
  recommends "CPAN::Meta::Requirements" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.17";
};

on 'develop' => sub {
  requires "Dist::Zilla" => "5.013";
  requires "Dist::Zilla::PluginBundle::DAGOLDEN" => "0.060";
  requires "File::Spec" => "0";
  requires "File::Temp" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::CPAN::Meta" => "0";
  requires "Test::More" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
};