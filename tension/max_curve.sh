#!/bin/bash

awk '$2==hi' hi=$(awk '{print $2}' strain-stress | sort -n | tail -1) strain-stress
