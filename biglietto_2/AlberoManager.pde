class AlberoManager
{
  //classe per la gestione di tutti gli aspetti che riguardano tutti gli alberi
  private float numAlberi;
  
  public AlberoManager()
  {
    setNumAlberi();
  }
  
  public void setNumAlberi()
  {
    //il numero di albri è un valore che va da 7 a 13
    this.numAlberi = random(5) + 7;
  }
  
  public float getNumAlberi(){return this.numAlberi;}
}
