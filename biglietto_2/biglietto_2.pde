
color sfondo = color(3,209,250);
FioccoManager fm = new FioccoManager();
FioccoDiNeve[] fiocchi = new FioccoDiNeve[int(fm.getNumFiocchi())];
StellaCometa sc;
Albero al;

float lungStella = 300;
// porporzioni impostate da me 
float altezzaStella = lungStella * 6 / 15;


public void setup(){
  size(800,800);
  background(sfondo);
  try
  {
    al = new Albero(width*2/4, height, 600, 300);
  }catch(Exception e)
  {System.out.println("i valori passati all'albero non sono accettabili");}
  try{
    sc = new StellaCometa(lungStella, altezzaStella, 4, 0, 20);
  }catch(Exception e)
  {System.out.println("i valori passati della stella cometa non sono accettabili");}
  for(int i = 0; i < fm.getNumFiocchi(); i++)
  {
    fiocchi[i] = new FioccoDiNeve();
  }
}

public void draw()
{
  background(sfondo);
  al.showAlbero();
  sc.showCometa();
  sc.muoviCometa();
  
  if(fm.getTimerComparsaFiocchi() > fm.getVelComparsaFiocchi() && fm.getContaFiocchi() < fm.getNumFiocchi() - 1)
    {
        fm.resetTimerComparsaFiocchi();
        fm.aggiornaContaFiocchi();
        fiocchi[int(fm.getContaFiocchi())] = new FioccoDiNeve();
    }
    
    for(int i = 0; i < fm.getContaFiocchi(); i++)
    {
        fiocchi[i].movimentoFiocco();
    }
    fm.aggiornaTimerComparsaFiocchi();
}
