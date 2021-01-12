//colore a caso del cielo tra le sfumature del blu
color sfondo = color(3, random(70)+ 150,250);

// dichiaro tuti gli oggeti di cui ho bisogno
FioccoManager fm;
FioccoDiNeve[] fiocchi;

StellaCometa sc;

AlberoManager alMan;
Albero[] al;

public void setup(){
  size(700,700);
  background(sfondo);
  // geenro il maanger degli alberi ed istanzio l'array di alberi
  alMan = new AlberoManager();
  al = new Albero[int(alMan.getNumAlberi())];
  
  try
  {
    //per la lunghezza dell'array di alberi istanzio un albero
    for(int p = 0; p < al.length; p++)
    {
      float altezza = random (100) + 210;    //altezza dell'albero casuale
      al[p] = new Albero(random(width) ,height, altezza, altezza/2);
    }
  }catch(Exception e)  //se i valori passati al costruttore dell'albero sono negativi
  {System.out.println("i valori passati all'albero non sono accettabili");}
  
  //lunghezza casuale della stella
  float lungStella = random(150)+150;
  // porporzioni impostate da me 
  float altezzaStella = lungStella * 6 / 15;
  
  try
  {
    //istanzio una stella cometa, e ci passo i valori al costruttore
    sc = new StellaCometa(lungStella, altezzaStella, 4, 0, random(height/2));
  }catch(Exception e)
  {System.out.println("i valori passati della stella cometa non sono accettabili");}
  
  //creo un fioccomanager e istanzio l'array di fiocchi di grandezza definita all'interno del fioccomanager
  fm = new FioccoManager();
  fiocchi = new FioccoDiNeve[int(fm.getNumFiocchi())];
  //per ogni elemento dell'array fiocchi istanzio un fiocco 
  for(int i = 0; i < fiocchi.length; i++)
     fiocchi[i] = new FioccoDiNeve();
}

public void draw()
{
  background(sfondo);
  noStroke();
  //disegno la cometa e la muovo
  sc.showCometa();
  sc.muoviCometa();
  
  // per tutti gli alberi, li disegno
  for(int i = 0; i < al.length; i++)
    al[i].showAlbero();
  
  // se il timer dei fiocchi è maggiore del tempo massimo del tempo di comparsa e c'è un fiocco che ha raggiunto il suolo
  
  if(fm.getTimerComparsaFiocchi() > fm.getVelComparsaFiocchi() && fm.getContaFiocchi() < fm.getNumFiocchi() - 1)
  {
    //resetto il timer, aggiorno il contatore del contatore dei fiocchi, e ritiro a caso
    
    fm.aggiornaContaFiocchi();
    fiocchi[int(fm.getContaFiocchi())].posizionaFiocco(); 
    fm.resetTimerComparsaFiocchi();
  }
  
  fm.aggiornaTimerComparsaFiocchi();
  
  //per tutti i fiocchi, muovo i fiocchi
  for(int i = 0; i < fiocchi.length; i++)
      fiocchi[i].movimentoFiocco();
  
}
