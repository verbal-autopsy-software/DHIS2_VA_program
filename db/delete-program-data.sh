#!/bin/bash

sudo -u postgres psql -d dhis2 -f delete-program-data.sql