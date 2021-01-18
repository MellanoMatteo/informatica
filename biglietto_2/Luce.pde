class Luce{
 private float x;
 private float y;
 private float raggio;
 private boolean accesa;
 
 private final color ACCESA = #FFFF00;
 private final color ROSSO = color (255,0,0);
 private final color SPENTA = #C0C0C0;
 
 public Luce(float x, float y, float raggio, boolean accesa) throws Exception
 {
   setX(x);
   setY(y);
   setRaggio(raggio); 
   setAccesa(accesa);
 }
 
 public void setAccesa(boolean accesa){this.accesa = accesa;}
 
 public void setX(float x) throws Exception
 {
   //if(x < 0)
     //throw new Exception("x non valida");
   this.x = x;
 }
 
 public void setY(float y) throws Exception
 {
   if(y < 0)
     throw new Exception("y non valida");
   this.y = y;
 }
 
 public void setRaggio(float raggio) throws Exception
 {
   if(raggio < 0)
     throw new Exception("raggio non valido");
   this.raggio = raggio;
 }
 
 public float getX(){return this.x;}
 public float getY(){return this.y;}
 
 public void showLuce()
 {
   if(accesa)
   {
     fill(ACCESA);
     //println("luce accesa: " + contLuce);
   }
   else
   {
     fill(SPENTA);
     //println("luce spenta: " + contLuce);
   }
   
   //println("x: " + this.x + "y: " + this.y);
   circle(this.x,this.y,this.raggio * 2);
 }
 
 public boolean isPremuto(float mx, float my)
 {
   float dx = mx - x;  //distanza delle x tra x del mouse e y del centro della luce
   float dy = my - y;
   boolean ris  = false;
   
   if(dx*dx + dy*dy < raggio*raggio)  // se il mouse si trova all'interno dell'area della luce
   {
     accesa = !accesa;
     ris = true;
   }
   return ris;
 }
}
