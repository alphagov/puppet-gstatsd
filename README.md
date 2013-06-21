Puppet Module: gstatsd
======================

This module will install gstatsd and configure it to send statistics to a
Graphite instance (on localhost by default)

It assumes that the python-dev python-pip are already installed by another
module such as https://github.com/stankevich/puppet-python

Parameters
----------

The following optional parameters are available:

[*flush_interval*]
How often to flush metrics to the Graphite server. The module (and gstatsd)
default is 10s.

[*graphite_server*]
The host on which Graphite (carbon-cache) is listening. The module default
is localhost.

[*graphite_port*]
The port on which Graphite (carbon-cache) is listening. The default port for
carbon-cache is 2003.

[*percent_threshold*]
When sending time information, calculate the Nth percentile. The default for
gstatsd is 90.

Examples
--------
```
  class { gstatsd:
    flush_interval    => 10,
    graphite_server   => 'localhost',
    graphite_port     => 2003,
    percent_threshold => 90,
  }
```

Licence
-------

Copyright (C) 2013, Sam J Sharpe

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

