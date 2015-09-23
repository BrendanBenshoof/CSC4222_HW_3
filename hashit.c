#include <stdio.h>
#include <openssl/evp.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>



int main(int argc, char *argv[])
{
EVP_MD_CTX *mdctx;
const EVP_MD *md;
unsigned char md_value[EVP_MAX_MD_SIZE];
int md_len, i;

OpenSSL_add_all_digests();

md = EVP_get_digestbyname("sha1");


mdctx = EVP_MD_CTX_create();
EVP_DigestInit_ex(mdctx, md, NULL);
char buffer[1] = {'A'};
while(read(0,buffer,sizeof(buffer))!=0){
  EVP_DigestUpdate(mdctx, buffer, 1);

}


EVP_DigestFinal_ex(mdctx, md_value, &md_len);
EVP_MD_CTX_destroy(mdctx);


for(i = 0; i < md_len; i++)
       printf("%02x", md_value[i]);
printf("\n");

/* Call this once before exit. */
EVP_cleanup();
exit(0);
}
