struct BitWriter
{
	FILE* f;
	int currentBit;
};

// bitWriter - funcion de inicializacion para: BitWriter
BitWriter bitWriter(FILE* f,int currentBit)
{
	BitWriter bitWriterVar;
	bitWriterVar.f=f;
	bitWriterVar.currentBit=currentBit;
	return bitWriterVar;
}

// bitWriterToDebug - funcion para mostrar o debuggear, para: BitWriter
string bitWriterToDebug(BitWriter x)
{
	stringstream sout;
	sout << fILE*ToDebug(x.f) << ",";
 	sout << to_string(x.currentBit);
	return sout.str();
}


------------------------------------------------------------------------
BitWriter bitWriter (FILE*& f)
{
   BitWriter bw;
   bw.f =f;
   bw.currentBit++;
   return bw;
}

void bitWriterWrite(BitWriter bw,int bit)
{
   FILE* f = bw.f;
   write(f,bit);
   bw.currentBit++;
}

template<typename T>
void bitWriterFlush(BitWriter bw)
{
   int multiplo = 8;

   int resto = bw.currentBit % multiplo;
   int var = bw.currentBit;

   if(resto != 0)
   {
      while(var > 8)
      {
         var = bw.currentBit -  multiplo;
      }
      while(var > 0)
      {
         bitWriterWrite(bw,0);
         var=-1;
      }
   }
}