#!/bin/bash

gimme-aws-creds && python3 ~/Developer/git/aws-assume-role/assume-role.py $1
