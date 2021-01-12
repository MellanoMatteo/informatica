public class Albero{
  
  //come coordinate passo le coordinate del centro del lato in basso del tronco
  private float x;
  private float y;
  private float h;
  private float larghezza;
  private int numFigure;
  private color coloreAlbero;
  private color coloreTronco;
  
  
  public Albero(float x, float y, float altezza, float larghezza) throws Exception
  {
    setX(x);
    setY(y);
    setH(altezza);
    setLarghezza(larghezza);
    //numero di trianogli casuali
    this.numFigure = int(random(4) + 3);  
    //colore casuale che varia da un verde chiaro ad uno scuro
    coloreAlbero = color(0,random(155) + 100, 0);
    //colore del tronco che varia da un marrone chiaro ad un marrone scuro
    coloreTronco = color (random(70) + 118, random (50) + 51, 0);
  }
  
  public void setX(float x)  {this.x = x;}
  public void setY(float y)  {this.y = y;}
  public void setH(float altezza) throws Exception
  {
    if(altezza < 0)
      throw new Exception("altezza non valida");
    this.h = altezza;
  }
  
  public void setLarghezza(float larghezza) throws Exception
  {
    if(larghezza < 0)
      throw new Exception("larghezza non valida");
    this.larghezza = larghezza;
  } 
  
  public void showAlbero()
  {
    //albero composto da numFigure-1 triangoli ed un rettangolo posto come tronco
    
    fill(coloreTronco);
    rect(x - larghezza / 8 , y - h / numFigure, larghezza / 4, h / numFigure );
    
    fill(coloreAlbero);
    for(int i = 1; i < numFigure; i++)
    // ordine dei vertici dei triangoli: centrale in alto, basso a destra, basso a sinistra
      triangle(x, yVerticeTri(i) , xAngoloSx(i), yBaseTri(i) , xAngoloDx(i), yBaseTri(i));
  }
  
  private float yVerticeTri(int cont) {return y - h + ( h / (numFigure * 2) * cont);}      //la y del vertice di un triangolo si trova a meta del triangolo sopra
  
  private float yBaseTri(int cont){return y - h +( h / numFigure * cont) + h/(numFigure * 3);}    //il "rettangolo contenente l'albero" viene diviso in numFigure parti uguali, le quali forniscono il livello delle basi dei triangoli, rispettivamente
                                                                                                  //assegnate dal contatore, ed abbassate di un certo valore 
  
  // la x e y del rettangolo sono speculari rispetto al valore medio della larghezza del rettangolo contenente l'albero, e vengono calcolate aggiungendo o sottraendo un valore a questa coordinata 
  private float xAngoloSx (int cont) {return x + larghezza * cont/6;}                             
  private float xAngoloDx(int cont)   {return x - larghezza * cont/6;}
 
}
