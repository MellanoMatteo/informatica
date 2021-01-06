public class DataManager {
    //proprietà della classe
    private int giorno;
    private int mese;
    private int anno;

    private CLInput cl;

    //costruttore a cui passo una stringa
    public DataManager(String stringa){
        boolean corretta = false;
        String pezziData[];
        while(!corretta)
        {
            try{
                //leggo la stringa che mi viene passata in input e la suddivido nelle varie parti della data, e con queste setto le prorpietà della classe
                pezziData = this.cl.readString(stringa).split("/");
                setAnno(Integer.parseInt(pezziData[2]));
                setMese(Integer.parseInt(pezziData[1]));
                setGiorno(Integer.parseInt(pezziData[0]));
                corretta = true;
            }catch(Exception e) // se viene generato un errore, lo faccio sapere all'utente, e gli faccio riinserire la data
            {
                System.out.println("errore: " + e.getMessage());
            }
        }
    }

    public void setGiorno(int giorno) throws Exception {
        //controllo che il mese sia corretto
        // se il mese inserito è tra quelli che hanno 31 giorni
        if (mese == 1 || mese == 3 || mese == 5 || mese == 7 || mese == 8 || mese == 10 || mese == 12) {
            if (giorno <= 0 || giorno > 31)
                throw new Exception(("giorno non valido"));
        } else if (mese == 2) { // altrimenti se è inserito il mese di febbraio controllo se l'anno è bisestile, se lo è il giorno massimo é il 29, altrimenti 28
            if (anno % 4 == 0) {
                if (giorno <= 0 || giorno >= 29)
                    throw new Exception(("giorno non valido"));
            } else if (giorno <= 0 || giorno > 28)
                throw new Exception(("giorno non valido"));
        } else if (giorno <= 0 || giorno > 30)           // altrimenti se il siamo in un altro caso, il mese ha 30 giorni, e quindi controllo per quel numero
            throw new Exception(("giorno non valido"));
        //se non viene generato nessun errore vuol dire che il numero di giorni inseriti è corretto e quindi lo salvo
        this.giorno = giorno;
    }

    public void setMese(int mese) throws Exception {
        //per il mese controllo che il numero inserito sia compreso tra tra 1 e 12
        if (mese > 12 || mese < 1)
            throw new Exception("mese non valido");
        this.mese = mese;
    }

    public void setAnno(int anno)   { this.anno = anno; } // l'anno non ha bisogno di particolari controlli

    public void addData() //funzione per sommare un numero di giorni ad una data
    {
        //si richiedono il numero di giorni che si vogliono sommare
        int sommaGiorni = cl.readInt("inserire il numero di giorni che si vogliono sommare alla data: ");
        //se il numero inserito dall'utente + il numero di giorni è maggiore di 365, vuol dire che posso sommare un anno alla data
        while(sommaGiorni + this.giorno > 365)
        {
            if(this.anno % 4 == 0 ) // se l'anno è bisestile tolgo 366 al numero di giorni inseriti, altrimenti tolgo solo 365, e aggiorno l'anno
                sommaGiorni -= 366;
            else
                sommaGiorni -= 365;
            this.anno++;
        }
        // se il numero di giorni + il giorno corrente è maggiore di 28, vuol dire che posso sommare ancora un mese
        while(sommaGiorni  + this.giorno > 28)
        {
            //tolgo dal contatore il numero di giorni corrispondenti al mese e aggioro il mese
            if(this.mese == 1 || this.mese == 3 || this.mese == 5 || this.mese == 7 || this.mese == 8 || this.mese == 10 || this.mese == 12)
                sommaGiorni -= 31;
            else if(this.mese == 2)
                if(this.anno % 4 == 0)
                    sommaGiorni -= 29;
                else
                    sommaGiorni -= 28;
            else
                sommaGiorni -= 30;
            this.mese++;
            //se nel conto il mese cambia anno, aggiungo uno all'anno e il mese sarà il resto della divisione
            this.anno += this.mese / 12 + 1;
            this.mese = this.mese % 12;

        }
        // quello che rimane viene sommato come giorni
        this.giorno += sommaGiorni;
    }


    public int nGiorni() // per ricavare il numero di giorni coorispondenti ad una data
    {
        int nGiorni = 0;

        for (int i = 1; i <= anno; i++) // per tutti gli anni fino alla data
        {
            nGiorni += 365; //aggiungo al contatore il numero di anni
            // se l'anno è bisestile, aggiungo ancora 1 giorno
            if(i % 4 == 0)
                nGiorni++;
        }
        for(int i = 1; i < mese; i++)       //per tutti i mesi da 1 al mese indcato nella data
            nGiorni += giorniDelMese(i);    //sommo al contatore il numero di giorni del mese
        nGiorni += giorno;                     // infine aggiungo al contatore il numero di giorni indicato dalla data

        return nGiorni;
    }

    private int giorniDelMese(int mese) // per identificare il numero del mese
    {
        if (mese == 1 || mese == 3 || mese == 5 || mese == 7 || mese == 8 || mese == 10 || mese == 12)
            return 31;      // se il mese ha 31 giorni, ritorno 31
        else if (mese == 2)
        {
            if (anno % 4 == 0)
                return 29;  // se siamo a febbraio in un anno bisestile, ritorno 29
            else
                return 28;  // se siamo a febbraio in un anno non bisestile, ritorno 28
        }
        else
            return 30;      // nel caso di un altro mese, ritorno 30
    }

    //metodo per stampare la data
    public void printData()     { System.out.println(this.giorno + "/" + this.mese + "/" + this.anno); }
}