#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

int main(int argc, char** argv){
  FILE* fp = fopen(argv[1],"w+");
  char buffer[1];
  while(fread(buffer, sizeof(char), 1 ,stdin)!=0){
    fwrite(buffer,sizeof(char), 1, stdout);
    fwrite(buffer,sizeof(char), 1, fp);
  }
}
