package TriggerSample::L10N::ja;
use strict;
use base 'TriggerSample::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
add_trigger するサンプル。
TEXT
}

1;
