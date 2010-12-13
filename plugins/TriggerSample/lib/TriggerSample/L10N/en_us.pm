package TriggerSample::L10N::en_us;
use strict;
use base 'TriggerSample::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
Sample plugin for adding triggers.
TEXT
}

1;
