 public class FioccoManager
{
  // classe per gestire l'insieme dei fiocchi di neve, e non il singolo
   private float numFiocchi;              //numero di fiocchi che compaiono nella schermata
   private float contaFiocchi;            //contatore dei ficchi gia presenti all'interno della schermata
   private float velComparsaFiocchi;      //velocita con cui i fiocchi vengono fatti cadere dall'alto
   private float timerComparsaFiocchi;    //contatore del tempo passato per il conteggio del timer
  
  public FioccoManager()
  {
    numFiocchi = 100;            
    contaFiocchi = 0;            
    velComparsaFiocchi = 100;
    timerComparsaFiocchi = 0;
  }
  
  public float getNumFiocchi (){return numFiocchi;}
  
  public float getContaFiocchi (){return contaFiocchi;}
  
  public float getVelComparsaFiocchi() {return velComparsaFiocchi;}
  
  public float getTimerComparsaFiocchi () {return timerComparsaFiocchi;}
  
  public void aggiornaContaFiocchi() {this.contaFiocchi++; }      //metodo per aggiornare il contatore dei fiocchi
  
  public void resetTimerComparsaFiocchi() {this.timerComparsaFiocchi = 0;}      //metodo per resettare il conteggio del timer dei fiocchi
  
  public void aggiornaTimerComparsaFiocchi() {this.timerComparsaFiocchi++;}    //metodo epr aggiornare io timer della comparsa dei fiocchi

}
