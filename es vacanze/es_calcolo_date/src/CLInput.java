import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class CLInput        //classe
{
    private BufferedReader br;          //proprietà

    CLInput()      //costruttore
    {
        InputStreamReader isr = new InputStreamReader(System.in);
        this.br = new BufferedReader(isr);
    }

    public String readString (String prompt) //metodo della classe
    {
        String in = null;
        while (in == null) // chiediamo l'input finchè il valroe va bene
        {
            System.out.print(prompt);  //stampo la stringa
            try {
                in = br.readLine();     //prendo in input la stringa
            } catch (IOException e) {   //se si sono generati degli errori nel try si esegue il catch
                e.printStackTrace();
                System.out.println("la stringa inserita non va bene");
            }
        }
        return in; // il metodo mi ritorna la stringa
    }

    public int readInt (String stringa) //metodo della classe
    {
        String lettura = null;
        int intero = 0;
        boolean inOK = false; //variabile per capire se la lettura è stata effettuata correttamente
        System.out.print(stringa);
        while(inOK == false)
        {
            try {
                lettura = br.readLine();
                intero = Integer.parseInt(lettura);
                inOK = true;
            }catch (Exception e) {
                System.out.println("la stringa passata non è convertibile in intero");
            }
        }
        return intero;
    }

    public float readFloat (String stringa) //metodo della classe
    {
        String lettura = null;
        float n_virgola = 0;
        boolean inOK = false;
        System.out.print(stringa);
        while(inOK == false)
        {
            try {
                lettura = br.readLine();
                n_virgola = Integer.parseInt(lettura);
                inOK = true;
            }catch (Exception e) {
                System.out.println("la stringa passata non è convertibile in float");
            }
        }
        return n_virgola;
    }

    public char readChar (String stringa) //metodo della classe
    {
        String lettura = null;
        char carattere = '\0';
        boolean inOK = false;
        System.out.print(stringa);
        while(inOK == false)
        {
            try {
                lettura = br.readLine();
                if(lettura.length() == 1) // controllo se la stringa è più lunga di 1 carattere
                {
                    carattere = lettura.charAt(0); //assegno alla variabile char la stringa
                    inOK = true;                    //mi contrassegno l'avvenuta lettura
                }
            }catch (Exception e) {
                System.out.println("la stringa passata non è convertibile in carattere");
            }
        }
        return carattere;
    }
}
