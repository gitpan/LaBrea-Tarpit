use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

do 'IANA/build_codes.pl';

WriteMakefile(
   'NAME'	  => 'LaBrea::Tarpit',
   'VERSION_FROM' => 'Tarpit.pm',		# finds $VERSION
   'PM'	   => {	'Tarpit.pm'	=> '$(INST_LIBDIR)/Tarpit.pm',
			'Codes.pm'	=> '$(INST_LIBDIR)/Codes.pm',
			'NetIO.pm'	=> '$(INST_LIBDIR)/NetIO.pm'},
   'dist'	  => {COMPRESS		=> 'gzip', SUFFIX => 'gz'}
);
