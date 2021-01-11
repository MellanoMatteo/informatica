public class Principale {

    private CLInput cli;

    Principale()
    {
        cli = new CLInput();
    }

    public static void main(String[] args)
    {
        Principale p = new Principale();
        // scelta identifica il numero di cosa vuole fare l'utente, in riferimento all'elenco
        int scelta = p.inserimentoScelta("Cosa si vuole fare:");
        // se non vuole uscire
        while(scelta != 3)
        {
            switch (scelta)
            {
                // se vuole sommare il numero di giorni ad una data
                case 1:
                    // faccio inserire la data
                    DataManager data = new DataManager("data a cui sommare i giorni");
                    // eseguo la somma e stampo la data ottenuta, passando come parametro al metodo il numero di gionri che si vogliono sommare
                    data.addData(p.cli.readInt("inserire il numero di giorni che si vogliono sommare alla data: "));
                    data.printData();
                    //chiedo all'utente se vuole ancora fare altro
                    scelta = p.inserimentoScelta("si volgiono eseguire altre operazioni?");
                    break;
                case 2:
                    //nel caso in cui l'utente voglia trovare il numero di giorni tra due date:
                    //gli faccio inserire le due date
                    DataManager data1 = new DataManager("data minuendo: ");
                    DataManager data2 = new DataManager("data sottraendo: ");
                    // ricavo il numero di giorni da ogni data
                    int nGiorni1 = data1.nGiorni();
                    int nGiorni2 = data2.nGiorni();
                    //stampo la differenza tra i due numeri ricavati

                    System.out.println("differenza tra i due anni: " + (nGiorni1 - nGiorni2) + " giorni");
                    //chiedo all'utente cosa vuole fare
                    scelta = p.inserimentoScelta("si vogliono eseguire altre operazioni?");
                    break;
            }
        }
    }

    public int inserimentoScelta(String stringa) //elenco di tutte le possibilità offerte all'utente
    {
        System.out.println(stringa);
        System.out.println("1.Sommare i giorni ad una data");
        System.out.println("2.Sottrarre due date");
        System.out.println("3.Uscire");
        return this.cli.readInt("");
    }
}
