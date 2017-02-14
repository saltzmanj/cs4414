#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
 
int main(void)
{
   regex_t    preg;
   char       *string = "a very simple simple simple string";
   char       *pattern = "^[A-Za-z0-9\s\.\-_]*([<|>\s]*[A-Za-z0-9\.\-_]+[A-Za-z0-9\.\-_\s]*)*$";
   int        rc;
   size_t     nmatch = 2;
   regmatch_t pmatch[2];
 
   if (0 != (rc = regcomp(&preg, pattern, REG_EXTENDED))) {
      printf("regcomp() failed, returning nonzero (%d)\n", rc);
      exit(EXIT_FAILURE);
   }
 
   if (0 != (rc = regexec(&preg, string,  (size_t)0, NULL, 0))) {
      printf("Failed to match '%s' with '%s',returning %d.\n",
             string, pattern, rc);
   }
   else {
      printf("With the whole expression, "
             "a matched substring \"%.*s\" is found at position %d to %d.\n",
             pmatch[0].rm_eo - pmatch[0].rm_so, &string[pmatch[0].rm_so],
             pmatch[0].rm_so, pmatch[0].rm_eo - 1);
      printf("With the sub-expression, "
             "a matched substring \"%.*s\" is found at position %d to %d.\n",
             pmatch[1].rm_eo - pmatch[1].rm_so, &string[pmatch[1].rm_so],
             pmatch[1].rm_so, pmatch[1].rm_eo - 1);
   }
   regfree(&preg);
   return 0;
 
   /****************************************************************************
      The output should be similar to :
 
      With the whole expression, a matched substring "simple simple" is found
      at position 7 to 19.
      With the sub-expression, a matched substring "simple" is found
      at position 7 to 12.
   ****************************************************************************/
}