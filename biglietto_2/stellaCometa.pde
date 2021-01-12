public class StellaCometa{
  
  // le coordinate corrispondono al punto in alto a sinistra della coda della stella 
  private float x;
  private float y;
  private float lunghezza;
  private float altezza;
  private float velocita;
  private final color coloreStella = color(255,255,51);
    
  public StellaCometa(float lunghezza, float altezza, float velocita, float x, float y) throws Exception
  {
    setLunghezza(lunghezza);
    setAltezza(altezza);
    setVelocita(velocita);
    setX(x);
    setY(y);
  }
  public void setLunghezza(float lunghezza) throws Exception{
    if(lunghezza < 0)
      throw new Exception("lunghezza non valida");
    this.lunghezza = lunghezza;
  }
  
  public void setAltezza(float altezza) throws Exception{
    if(altezza < 0)
      throw new Exception("altezza non valida");
    this.altezza = altezza;
  }
  
  public void setVelocita(float velocita) throws Exception{
    if(velocita < 0)
      throw new Exception("velocita non valida");
    this.velocita = velocita;
  }
  
  public void setX(float x) throws Exception{
    if(x < 0)
      throw new Exception("x non valida");
    this.x = x;
  }

  public void setY(float y) throws Exception{
    if(y < 0)
      throw new Exception("velocita non valida");
    this.y = y;
  }

  public void showCometa()
  {
    fill(coloreStella);
    
    //triangle(x1,y1,x2,y2,x3,y3) 
    //coda della stella
    triangle(x, y, x, y + altezza,x + lunghezza*2/3,  y + altezza/2);
    
    //numero i vertici della stella da 1 a 6 in senso orario partendo da quello a ore 12
    float xPunteStella1_4 = x + lunghezza * 5 / 6;
    float yPunteStella2_6 = y + (altezza -  altezza * 3 / 4);
    float xPunteStella5_6 = x + lunghezza*2/3;
    float yPunteStella3_5 = y + altezza * 3 / 4;
    
    //stella in punta composta da due triangoli
    
    // in ordine vertici 2,4,6
    triangle(x + lunghezza, yPunteStella2_6, xPunteStella1_4, y + altezza, xPunteStella5_6, yPunteStella2_6);
    //in ordine 1,3,5
    triangle(xPunteStella1_4, y, x + lunghezza, yPunteStella3_5, xPunteStella5_6, yPunteStella3_5);
  }
  
  public void muoviCometa()  // metodo per il movimento della cometa: se è all'interno della schermata continua a muoversi verso destra, quando è completamente fuori, ricompare a sinistra
  {
    if(x < height)
      x+=velocita;
    else
      x = -1 * lunghezza; 
  }
}
