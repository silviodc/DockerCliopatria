#! /usr/bin/env bash
cd /opt/cliopatria/ && ./configure && swipl run.pl cpack install swish && swipl run.pl
