Homework 4: Hashpipe
=====================

The purpose of this assignment is to write a useful unix utility in C.

In unix system management, especially around installing bleeding edge tools, there is a recurrent pattern of using:

```

curl path | bash

```

as a method of installation.


While this is an efficient method of mass installing with a script, because the contents of the requested file are not checked,
this opens the user to potential security vulnerabilities.

You will build a tool to augment this use case with some security measures.
We will use a cryptographic hash function (sha1 to be precise) to test the contents of the requested file before outputting it.

The new use case is:

```

curl path | hashpipe [hash id] | bash

```

where hashpipe will only output if the inputted data matches the supplied hash id.
You should have access to "hashit.c" which can be used to generate valid hashes for files.

your code will need to address the following:

- checking that there are appropriate arguments
- hashing the contents of stdin using openssl's sha1 function
- converting the results to a hexidecimal string
- comparing the results with the argument provided
- outputting results iff the hashes match
