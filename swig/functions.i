/* name of module to use*/
%module functions
%{
    /* Every thing in this file is being copied in 
     wrapper file. We include the Cpp header file necessary
     to compile the interface */
    #include "functions.hpp"
  
%}

/* explicitly list functions and variables to be interfaced */
long long int fact(long long int n);
int sumNumbers(int a, int b, int c);
  
/* or if we want to interface all functions then we can simply
   include header file like this - 
   %include "functions.hpp"
*/