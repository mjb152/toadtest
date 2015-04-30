package Test1;
use Mojo::Base 'Mojolicious';
use File::Basename 'dirname';                           # required as we moved templates and public dirs
use File::Spec::Functions 'catdir';                     # required as we moved templates and public dirs

# This method will run once at server start
sub startup {
  my $self = shift;

  # The next few lines allow this module to be cpan'd up ready for install anywhere
  $self->home->parse(catdir(dirname(__FILE__), 'Test1'));       # Switch to installable home directory
  $self->static->paths->[0] = $self->home->rel_dir('public');      # Switch to installable "public" directory
  $self->renderer->paths->[0] = $self->home->rel_dir('templates'); # Switch to installable "templates" directory

  # Route
  my $r = $self->routes;

  $r->route('/')->name('index')->to(cb => sub { shift->render('index') });

}

1;
