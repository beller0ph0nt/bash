#!/bin/bash

valgrind -v --leak-check=full --show-leak-kinds=all ./avg > memleak.dmp