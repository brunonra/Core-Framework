#!/bin/bash
make compile
make run-server && sleep 5 && make run-client
