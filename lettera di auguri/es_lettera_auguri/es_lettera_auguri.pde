//esercizio biglietto di auguri natale


PFont fontTesto; // una variabile che contiene un tipo di font
String string = "Caro Matteo, %spero che tu possa passare il più bel Natale di sempre %baci %la nonna";  //messaggio del biglietto di auguri
final color nero = color(0,0,0);


public void setup(){
  size (500,700);
  background(246,219,156);
  textFont(createFont("Vivaldi", 100));                      //creo e applico un font a piacimento
  textSize(40);
  fill(nero);                                              //imposto che le lettere inserite siano scritte in colore nero
}

  float x = 10;             //x di partenza della stringa
  float y = 40;             //y di partenza della stringa
  
  char c;                   //carattere per scrivere riga per riga 
  int contLettere = 0, opacita = 50;        //j è il cont. delle lettere, i è la loro opacità di partenz

public void draw()
{
  if(contLettere < string.length())    //per tutta la lunghezza della stringa, ovvero tutto il messaggio
  {
    c = string.charAt(contLettere);    //seleziono il carattere da scrivere della stringa 
    
    if (x + textWidth(c) > width)      //se sono alla fine della riga
    {
      fill(nero,opacita);                   //scrivo di colore nero e con l'opacità a piacere
      y += textWidth('A') * 3 / 2;          //vado a capo del doppio della larghezza della lettera
      x = 0;                                //torno all'inizio della riga
    }
    else if(c == ' ')                      // se è uno spazio evito di aggiornare l'opacità e quindi creare un tempo vuoto non desiderato
    {   
      fill(nero,opacita);             //scrivo in nero e con 
      text(c, x, y);                  //scrivo la lettera c alle coordinate x;y
      x += textWidth(c);              //tutte le volte aggiorno la x per scrivere la lettera successiva esattamente accanto alla precedente
      contLettere++;                  //passo alla lettera successiva
    }
    else if ( c == '%')               //se il carattere è % (il mio \n)
    {
      fill(nero,opacita);             //scrivo di colore nero e con l'opacità a piacere
      y += textWidth('A') * 3 / 2;          //vado a capo del doppio della larghezza della lettera
      x = 0;                          //torno all'inizio della riga
      contLettere++;                  //passo alla lettera successiva
    }
    else
    {
      if(opacita < 204)                // se non ho ancora raggiunto il valore di opacità desiderato
      {
        fill(nero,opacita);            //scrivo con la stessa opacità sulla lettera già presente
        text(c, x, y);                 //scrivo la lettera c alle coordinate x;y
        opacita+=3;                    //aggiorno l'opacità (non troppo performante in quanto andando a riscrivere sulla lettera prec. le due opacità si sommano)
      }
      else
      {
       opacita = 30;                  //se ho superato il limite di opacità, ritorno al valore di partenza
       contLettere++;                  //passo alla lettera successiva
       x += textWidth(c);              //aggiorno la x della lettera per scrivere di seguito
      }
    }
  }
}
