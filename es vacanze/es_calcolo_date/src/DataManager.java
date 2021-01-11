public class DataManager {
    //proprietà della classe
    private int giorno;
    private int mese;
    private int anno;
    //COSTANTI
    private final int GIORNI_FEBB_NNBIS = 28;
    private final int MAX_GIORNI_30 = 30;
    private final int MAX_GIORNI_31 = 31;
    private final int MESI_ANNO = 12;
    private final int GIORNI_ANNO_NNBIS = 365;

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
        // se il mese inserito è tra quelli che hanno 31 giornI
        switch (giorniDelMese(mese))
        {
            case 1, 3, 5, 7, 8, 10, 12:
                if (giorno <= 0 || giorno > MAX_GIORNI_31)
                    throw new Exception(("giorno non valido"));
                break;
            case 2:
                if (anno % 4 == 0) {
                    if (giorno <= 0 || giorno >= GIORNI_FEBB_NNBIS + 1)
                        throw new Exception(("giorno non valido"));
                } else if (giorno <= 0 || giorno > GIORNI_FEBB_NNBIS)
                    throw new Exception(("giorno non valido"));
                break;
            case 4, 6, 9, 11:
                if (giorno <= 0 || giorno > MAX_GIORNI_30)           // altrimenti se il siamo in un altro caso, il mese ha 30 giorni, e quindi controllo per quel numero
                    throw new Exception(("giorno non valido"));
                break;
            default:
                throw new Exception("mese non valido");
        }
        this.giorno = giorno;
    }

    public void setMese(int mese) throws Exception {
        //per il mese controllo che il numero inserito sia compreso tra tra 1 e 12
        if (mese > MESI_ANNO || mese < 1)
            throw new Exception("mese non valido");
        this.mese = mese;
    }

    public void setAnno(int anno)   { this.anno = anno; } // l'anno non ha bisogno di particolari controlli

    public void addData(int sommaGiorni) //funzione per sommare un numero di giorni ad una data
    {
        //se il numero inserito dall'utente + il numero di giorni è maggiore di 365, vuol dire che posso sommare un anno alla data
        while(sommaGiorni + this.giorno > GIORNI_ANNO_NNBIS)
        {
            if(this.anno % 4 == 0 ) // se l'anno è bisestile tolgo 366 al numero di giorni inseriti, altrimenti tolgo solo 365, e aggiorno l'anno
                sommaGiorni -= GIORNI_ANNO_NNBIS + 1;
            else
                sommaGiorni -= GIORNI_ANNO_NNBIS;
            this.anno++;
        }
        // se il numero di giorni + il giorno corrente è maggiore di 28, vuol dire che posso sommare ancora un mese
        while(sommaGiorni  + this.giorno > GIORNI_FEBB_NNBIS)
        {
            sommaGiorni -= giorniDelMese(this.mese);
            this.mese++;
            //se nel conto il mese cambia anno, aggiungo uno all'anno e il mese sarà il resto della divisione
            this.anno += this.mese / MESI_ANNO + 1;
            this.mese = this.mese % MESI_ANNO;

        }
        // quello che rimane viene sommato come giorni
        this.giorno += sommaGiorni;
    }

    public int nGiorni() // per ricavare il numero di giorni coorispondenti ad una data
    {
        int nGiorni = 0;
        for (int i = 1; i <= anno; i++) // per tutti gli anni fino alla data
        {
            nGiorni += GIORNI_ANNO_NNBIS; //aggiungo al contatore il numero di anni
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
            return MAX_GIORNI_31;      // se il mese ha 31 giorni, ritorno 31
        else if (mese == 2)
        {
            if (anno % 4 == 0)
                return GIORNI_FEBB_NNBIS + 1;  // se siamo a febbraio in un anno bisestile, ritorno 29
            else
                return GIORNI_FEBB_NNBIS;  // se siamo a febbraio in un anno non bisestile, ritorno 28
        }
        else
            return MAX_GIORNI_30;      // nel caso di un altro mese, ritorno 30
    }
    //metodo per stampare la data
    public void printData()     { System.out.println(this.giorno + "/" + this.mese + "/" + this.anno); }
}