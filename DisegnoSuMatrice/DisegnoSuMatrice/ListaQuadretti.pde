class ListaQuadretti
{
  private Quadretto[] quadretti;
  private Griglia griglia;
  private int quanti;
  
  public ListaQuadretti(Griglia griglia){
    this.quanti = 0;
    this.griglia = griglia;
    quadretti = new Quadretto[griglia.getColonne() * griglia.getRighe()];
  }
  
  public void aggiungiQuadretto(Quadretto q)
  {
    if(q == null)  {return;}
    
    int pos = this.ricercaQuadretto(q);
    println(pos + "  " + quanti);
    if(pos == -1){
      println(q.toString());
      quadretti[quanti++] = q;
    }else{
      println(q.toString());
      this.rimuoviQuadretto(pos);
    }
  }
  
  public int ricercaQuadretto(Quadretto q)
  {
    int i = 0;
    int pos = -1;
    // quando cambia pos esce altrimenti continua la comparazione
    while(pos == -1 && i < quanti)
    {
      if(quadretti[i].equals(q)){
        pos = i;
      }
      i++;
    }
    return pos;
  }
  
  public void rimuoviQuadretto(int pos){
    println("rimosso" + quadretti[pos].toString());
    for(int i = pos; i < quanti-1; i++){
      
      quadretti[i] = quadretti[i+1];
    }
    quanti--;
  }
  
  public void disegna()
  {
    for(int i = 0; i < quanti; i++){
      griglia.disegnaQuadretto(quadretti[i]);
     }
  }
}
