class FioccoDiNeve
{
  //proprieta della classe
   private char value;    // mi serve per disegnare gli asterischi 
   private float dim;
   private float altezza;
   private float xFiocco;
   private float velocita;

   private final color bianco = color(255,255,255);
   private final float MAX_DIM_FIOCCHI = 60;
   private final float MIN_DIM_FIOCCHI = 10;
   private final float MAX_VELOCITA = 4;
   private final float MIN_VELOCITA = 1;
   
   public FioccoDiNeve()
   {
       value = '*';
       posizionaFiocco();    //posiziono il fiocco di neve in una posto a caso al di sopra della schermata 
   }
   
   public float getAltezza(){ return this.altezza; }
   
   public float getDim() {return this.dim;}
   
   public void movimentoFiocco()      //metodo per la caduta del fiocco verso il basso
   {
       if(getAltezza() < height + getDim())    //se  il fiocco si trova ancora nella schermata
        {
           textSize(dim);                      //continua la sua caduta , venendo ridisegnato più in basso a seconda della sua velocita, con lo stesso colore e lo stesso valore
           altezza += velocita;
           fill(bianco, 255);
           text(value, xFiocco, altezza);
        }
        else      //altrimenti il fiocco è uscito dalla schermata e quindi lo riporto in alto 
            posizionaFiocco(); 
   }
   
   public void posizionaFiocco()    //setto dimensione e posizione rispetto alla x casuali e porto il fiocco in alto
   {
     this.dim =random(MAX_DIM_FIOCCHI)+MIN_DIM_FIOCCHI;    
     this.xFiocco =random(width);
     this.altezza = 0;
     this.velocita =random(MAX_VELOCITA) + MIN_VELOCITA;    //setto una velocita di caduta casuale di ogni fiocco
   }
}
