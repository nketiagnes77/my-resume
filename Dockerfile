name: Resume ci Build
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Build the Docker image with tag
      run: docker build . --file Dockerfile --tag my-image-name:${{github.run_number}}
    - name: Build latest 
      run: docker build . --file Dockerfile --tag my-image-name