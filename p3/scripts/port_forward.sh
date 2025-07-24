#!/bin/bash

sudo kubectl port-forward service/playground-service -n dev 8888:8888

