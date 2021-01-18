//colore a caso del cielo tra le sfumature del blu
color sfondo = color(3, random(70)+ 150,250);

// dichiaro tuti gli oggetti di cui ho bisogno
FioccoManager nevicata;
StellaCometa sc;
AlberoManager foresta; 

public void setup()
{
  size(700,700);
  background(sfondo);
  
  //creo un fioccomanager e istanzio l'array di fiocchi di grandezza definita all'interno del fioccomanager
  nevicata = new FioccoManager();
  nevicata.initFiocchi();
     
  // genero il mananger degli alberi ed istanzio l'array di alberi
  foresta = new AlberoManager();
  foresta.initAlberi();
  
  //lunghezza casuale della stella
  float lungStella = random(150)+150;
  // porporzioni impostate da me 
  float altezzaStella = lungStella * 6 / 15;
  
  try
  {
    //istanzio una stella cometa, e ci passo i valori al costruttore
    sc = new StellaCometa(lungStella, altezzaStella, 4, 0, random(height/2));
  }catch(Exception e)
  {
    System.out.println("i valori passati della stella cometa non sono accettabili");
  }
}

public void draw()
{
  background(sfondo);
  noStroke();
  //disegno la cometa e la muovo
  sc.showCometa();
  sc.muoviCometa();
  
  // disegno a schermo tutti gli alberi
  foresta.showForesta();
  
  //disegno tutti i fiocchi
  nevicata.nuovoFiocco();
  
  //per tutti i fiocchi, muovo i fiocchi
  nevicata.muoviFiocchi();
  
}

public void mousePressed()
{
  foresta.luceDiAlberoPremuta(mouseX, mouseY);
}
  
