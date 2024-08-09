#!/bin/bash

responseCode=$(curl --write-out %{http_code} --silent --output /dev/null https://adopet-frontend-cypress.vercel.app/home)

echo $responseCode
