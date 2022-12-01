#!bin/bash

cd test
test_files=$(ls *_test.rb)
for test_file in $test_files
do
 ruby $test_file 
done
