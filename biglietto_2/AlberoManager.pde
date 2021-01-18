class AlberoManager
{
  //classe per la gestione di tutti gli aspetti che riguardano tutti gli alberi
  private float numAlberi;
  private Albero[] albero;
  
  public AlberoManager()
  {
    setNumAlberi();
    albero = new Albero[int(getNumAlberi())];
  }
  
  public void setNumAlberi()
  {
    //il numero di albri è un valore che va da 7 a 13
    this.numAlberi = random(5) + 7;
  }
  
  public float getNumAlberi(){return this.numAlberi;}
  
  // disegno gli alberi a schermo
  public void showForesta() 
  {
    for(int i = 0; i < albero.length; i++)
      albero[i].showAlbero();
  }
  
  public void initAlberi()
  {
     try
    {
      //per la lunghezza dell'array di alberi istanzio un albero
      for(int p = 0; p < foresta.albero.length; p++)
      {
        // per tutti gli alberi istanzio un nuovo albero e metto tutte le luci
        float altezza = random (100) + 210;    //altezza dell'albero casuale
        albero[p] = new Albero(random(width) ,height, altezza, altezza/2);
        
        // per ogni albero devo richiamare l'inizializzazione di tutte le luci di questo albero
        albero[p].initLuci();
      } 
    }catch(Exception e)  //se i valori passati al costruttore dell'albero sono negativi
    {
      System.out.println("i valori passati all'albero non sono accettabili");
    } 
  }
  
  //per tutte le catene, controllo la pressione
  public void luceDiAlberoPremuta(float mx, float my)
  {
    for(int i = 0; i < albero.length; i++)
    {
      albero[i].lucePremuta(mx,my);
    }
  }
}
