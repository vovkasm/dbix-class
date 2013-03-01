package # hide from PAUSE
    DBICTest::Schema::CD_to_Producer;

use warnings;
use strict;

use base qw/DBICTest::BaseResult/;

__PACKAGE__->table('cd_to_producer');
__PACKAGE__->add_columns(
  cd => { data_type => 'integer' },
  producer => { data_type => 'integer' },
  attribute => { data_type => 'integer', is_nullable => 1 },
);
__PACKAGE__->set_primary_key(qw/cd producer/);

__PACKAGE__->refers_to(
  'cd', 'DBICTest::Schema::CD',
  { 'foreign.cdid' => 'self.cd' }
);

__PACKAGE__->refers_to(
  'producer', 'DBICTest::Schema::Producer',
  { 'foreign.producerid' => 'self.producer' },
  { on_delete => undef, on_update => undef },
);

1;
