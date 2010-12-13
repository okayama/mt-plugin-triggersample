package MT::Plugin::TriggerSample;
use strict;
use MT;
use MT::Plugin;
use base qw( MT::Plugin );
@MT::Plugin::TriggerSample::ISA = qw( MT::Plugin );

our $VERSION = 0.1;
our $PLUGIN_NAME = 'TriggerSample';

my $plugin = new MT::Plugin::TriggerSample( {
    name => $PLUGIN_NAME,
    id => $PLUGIN_NAME,
    key => lc $PLUGIN_NAME,
    author_name => 'okayama',
    author_link => 'http://weeeblog.net/',
    description => '<MT_TRANS phrase=\'_PLUGIN_DESCRIPTION\'>',
    version => $VERSION,
    l10n_class => $PLUGIN_NAME . '::L10N',
} );

MT->add_plugin( $plugin );

if ( my @models = MT->models ) {
    for my $model ( @models ) {
        if ( my $class = MT->model( $model ) ) {
            $class->add_trigger(
                pre_save => sub {
                    if ( my $column_names = $class->column_names ) {
                        if ( my $column_defs = $class->install_properties->{ column_defs } ) {
                            for my $column_name ( @$column_names ) {
                                if ( my $type = $column_defs->{ $column_name }->{ type } ) {
                                    if ( $type eq 'integer' ) {
                                        # hoge
                                        # Because of process loop, MT->log() is not allowed.
                                    }
                                }
                            }
                        }
                    }
                }
            );
        }
    }
1;
}