#!/bin/bash

gcc -std=c99 hashit.c -o hashit -lcrypto
gcc -std=c99 hashpipe.c -o hashpipe -lcrypto




if [ "`echo "abcd" | ./hashit`" = "3330b4373640f9e4604991e73c7e86bfd8da2dc3" ]
then
echo "TEST 1 PASSED: HASHIT WORKS"
else
echo "TEST 1 FAILED: HASHIT FAILED"
fi

if [ "`echo "abcd" | ./hashpipe 3330b4373640f9e4604991e73c7e86bfd8da2dc3 `" = "abcd" ]
then
echo "TEST 2 PASSED: HASHPIPE WORKS"
else
echo "TEST 2 FAILED: HASHPIPE FAILS"
fi

if [ "`echo "abcd" | ./hashpipe 3330b4373640f9e4604991e73c7e86bfd8da2dc3 | ./hashit`" = "3330b4373640f9e4604991e73c7e86bfd8da2dc3" ]
then
echo "TEST 3 PASSED: HASHPIPE has proper output"
else
echo "TEST 3 FAILED: HASHPIPE hash proper output"
fi

if [ "`echo "abcd" | ./hashpipe 3330b4373640f9e4604991e73c7e86bfd8da2dc4 `" = "" ]
then
echo "TEST 4 PASSED: HASHPIPE failed to output properly"
else
echo "TEST 4 FAILED: HASHPIPE failed to fail to output"
fi
