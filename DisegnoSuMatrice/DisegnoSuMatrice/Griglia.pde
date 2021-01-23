class Griglia {
  private float altezza, larghezza;
  private int righe, colonne;
  private ListaQuadretti lQuadretti;
  
  public Griglia(float altezza, float larghezza, int righe, int colonne) {
    this.altezza=altezza;
    this.larghezza=larghezza;
    this.righe=righe;
    this.colonne=colonne;
    // rapporto 1:1 rispetto a listaquadretti, gli passo l'oggetto stesso
    this.lQuadretti = new ListaQuadretti(this);
  }
  
  public float larghezzaQuadretto() {
    return larghezza / colonne;
  }

  public float altezzaQuadretto() {
    return altezza / righe;
  }  
  
  public void disegna() {
    float lq = larghezzaQuadretto();
    float hq = altezzaQuadretto();
    
    // disegna griglia
    for(int i=0; i<=righe; i++) {
      line(0, hq*i, larghezza, hq*i);
    }
    for(int i=0; i<=colonne; i++) {
      line(lq*i, 0, hq*i, altezza);
    }
    //disegna tutti i quadretti
    
    lQuadretti.disegna();
  }
  
  public float getLarghezza() {
    return larghezza;
  }

  public float getAltezza() {
    return altezza;
  }
  
  public int getColonne() {
    return colonne;
  }
  
  public int getRighe() {
    return righe;
  }
  
  public void clickMouse(float x, float y)
  {
    int r = int(y * this.getRighe() / this.getAltezza());
    int c = int(x * this.getColonne() / this.getLarghezza());
    
    Quadretto q = new Quadretto(r,c);
    lQuadretti.aggiungiQuadretto(q);
  }
  
  public void disegnaQuadretto(Quadretto q){
    float hq = this.altezzaQuadretto();
    float lq = this.larghezzaQuadretto();
    fill(255,0,0);
    rect(q.getC() * lq, q.getR() * hq, lq, hq); 
    
  }
}
