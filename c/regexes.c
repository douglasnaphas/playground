#include <stdio.h>
#include <regex.h>

/**
 * Based on
 * https://stackoverflow.com/questions/59563611/matching-forward-slash-in-regex
 * Run with
 * gcc -o regexes regexes.c && ./regexes
 */

int main() {
  regex_t regex;
  int reti;
  reti = regcomp(&regex, "^/.{3}[0-9]", REG_EXTENDED);
  if(reti) {
    printf("could not compile regex\n");
    return 1;
  }
  reti = regexec(&regex, "/ABC5", 0, NULL, 0);
  if(reti) {printf("no match\n");} else {printf("match\n");}
  return reti;
}
