#!/bin/bash

# Script to start OWASP's juice-shop (docker image)
# Container will be removed upon exiting..

/usr/bin/docker run --rm -p 3000:3000 bkimminich/juice-shop
