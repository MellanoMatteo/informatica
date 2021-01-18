class FioccoManager
{
  // classe per gestire l'insieme dei fiocchi di neve, e non il singolo
   private float numFiocchi;              //numero di fiocchi che compaiono nella schermata
   private float contaFiocchi;            //contatore dei ficchi gia presenti all'interno della schermata
   private float velComparsaFiocchi;      //velocita con cui i fiocchi vengono fatti cadere dall'alto
   private float timerComparsaFiocchi;    //contatore del tempo passato per il conteggio del timer
   private FioccoDiNeve[] fiocco;
  
  public FioccoManager()
  {
    numFiocchi = 100;            
    contaFiocchi = 0;            
    velComparsaFiocchi = 3;
    timerComparsaFiocchi = 0;
    fiocco = new FioccoDiNeve[int(getNumFiocchi())];
  }
  
  public float getNumFiocchi (){return numFiocchi;}
  
  public float getContaFiocchi (){return contaFiocchi;}
  
  public float getVelComparsaFiocchi() {return velComparsaFiocchi;}
  
  public float getTimerComparsaFiocchi () {return timerComparsaFiocchi;}
  
  public void aggiornaContaFiocchi() {this.contaFiocchi++; }      //metodo per aggiornare il contatore dei fiocchi
  
  public void resetTimerComparsaFiocchi() {this.timerComparsaFiocchi = 0;}      //metodo per resettare il conteggio del timer dei fiocchi
  
  public void aggiornaTimerComparsaFiocchi() {this.timerComparsaFiocchi++;}    //metodo epr aggiornare io timer della comparsa dei fiocchi
  
  public void nuovoFiocco()
  {
    // se il timer è valido e c'è non tutti i fiocchi sono sullo schermo
    if(getTimerComparsaFiocchi() > getVelComparsaFiocchi() && getContaFiocchi() < getNumFiocchi() - 1)
    {
      //resetto il timer, aggiorno il contatore del contatore dei fiocchi, e ritiro a caso
    
      aggiornaContaFiocchi();
      fiocco[int(nevicata.getContaFiocchi())].posizionaFiocco(); 
      resetTimerComparsaFiocchi();
    }
    // in ogni caso aggiorno il timer
    aggiornaTimerComparsaFiocchi();
  }
  
  public void muoviFiocchi()  //muovo i fiocchi 
  {
      for(int i = 0; i < nevicata.getContaFiocchi(); i++)
        fiocco[i].movimentoFiocco();
  }
  
  public void initFiocchi()
  {
    //per ogni elemento dell'array fiocchi istanzio un fiocco 
    for(int i = 0; i < nevicata.fiocco.length; i++)
       nevicata.fiocco[i] = new FioccoDiNeve(); 
  }

}
