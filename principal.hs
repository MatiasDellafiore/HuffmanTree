struct InfoByte
{
   unsigned int n; // cuantas veces aparece el byte?
   string cod;
};

// paso 1 - contar cuantas veces aparece cada byte
void paso1(string nomArchOri,InfoByte arr[])
{
   FILE*f = fopen(nomArchOri.c_str(),"w+b");

   int cont=0;
   for(int i=0;i<=256;i++)
   {
      for(int p=1;p<=256;p++)|
      {
         if (arr[i] == arr[i+p])
         {
            cont++;
         }
      }
   }
   fclose(f);
}

// paso 2 - crear la lista y ordenarla
int cmpTamanio(int a, int b)
{
   return a-b;
}

List<HuffmanTreeInfo> paso2(InfoByte arr[])
{
   List<HuffmanTreeInfo> x = lst;

   FILE* f = fopen("","r+b");
   int t = fileSize(f);
   int x;
   for (int i=0;i<=t;i++)
   {
      listAdd<HuffmanTreeInfo>(lst,arr[i]);
   }

   return listSort(lst,cmpTamanio());
   return 0;
}

// paso 3 - convertir la lista en arbol
HuffmanTreeInfo* paso3(List<HuffmanTreeInfo> lst)
{
   return NULL;
}

// paso 4 - recorrer el arbol y guardar los codigos en el array
void paso4(InfoByte arr[],HuffmanTreeInfo* raiz)
{

}

// paso 5 - recorrer el archivo original, grabar encab y bit x bit el archivo comprimido
void paso5(string nomArchOri,InfoByte arr[])
{
}

void comprimir(string nomArchOri)
{
   InfoByte arr[256];

   // paso 1 - contar cuantas veces aparece cada byte
   paso1(nomArchOri,arr);

   // paso 2 - crear la lista y ordenarla
   List<HuffmanTreeInfo> lista = paso2(arr);

   // paso 3 - convertir la lista en arbol
   HuffmanTreeInfo* raiz = paso3(lista);

   // paso 4 - recorrer el arbol y guardar los codigos en el array
   paso4(arr,raiz);

   // paso 5 - recorrer el archivo original y grabar bit x bit el archivo comprimido
   paso5(nomArchOri,arr);
}

void descomprimir(string nomArchCompr)
{

}


int main(int argc,char** argv)
{
   // nombre del archivo con el que voy a trabajar
   string nomArch = argv[1];

   // comprimo o descomprimo?
   if( !endsWith(nomArch,".huf") )
   {
      comprimir(nomArch);
   }
   else
   {
      // descomprimo
      descomprimir(nomArch);
   }

   return 0;
}