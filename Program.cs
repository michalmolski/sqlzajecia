using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Inserts_zaj
    {
        // dane wsodowe producentów
        string[] pcpr = new string[]
            {"DELL","LENOVO","MSI","HP","ACER","APPLE" };
        string[] drpr = new string[]
            {"HP","BOTHER","EPSON","CANON","SAMSUNG"};
        string[] lapr = new string[]
            {"DELL","LENOVO","MSI","HP","ACER","APPLE","ASUS" };

        //metoda generująca produkty
        public void Save(int l)
        {
            
            //zestaw znaków generujący kod
            string codesource = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            char[] code = new char[8]; // łancuch przechowywujacy kod
            string prod;    //łańcuch przechowujący producenta

            //tablica przechowujące dane o produktach
            string[,] products = new string[l, 3];
            //generator losowy
            Random rand = new Random();
            int i = 0;
            //----------pisanie do pliku---------
            FileStream fout;
           string dat= "INSERT_" +DateTime.Now.ToString()+".sql"; // nazwa sciezki
            // modyfikacja nazwy sciezki - usuniecie nieprawidlowych znakow
            dat = dat.Replace("/","-");
            dat = dat.Replace(":", "-");

            Console.WriteLine(dat);
            fout = new FileStream(dat,FileMode.Create);//inicjowanie strumienia
            StreamWriter fwrite = new StreamWriter(fout);
            while (l > i)
            {
                for (int j = 0; j < 8; j++) //generowanie kodu produktu
                {
                    code[j] = codesource[rand.Next(codesource.Length)];

                }

                string cod = new string(code);
                products[i, 0] = cod; // wpisanie kodu produktu
                if (i <= (l / 3))
                {
                    prod = pcpr[rand.Next(pcpr.Length)];

                    products[i, 1] = prod;
                    products[i, 2] = "pc"; // wpisanie do tabeli odpowiednich danych
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[Produkty](model,typ,producent)" +
                        " VALUES('" + cod + "',' pc',' " + prod + "')" );
                }
                else if ((i >= (l / 3)) & (i <= (2 * l / 3)))
                {
                    prod = lapr[rand.Next(lapr.Length)];

                    products[i, 1] = prod;
                    products[i, 2] = "laptop";
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[Produkty](model,typ,producent)" +
                        " VALUES('" + cod + "',' laptop',' " + prod + "')" );
                }
                else if ((i >= (2 * l / 3)))
                {
                    prod = drpr[rand.Next(drpr.Length)];

                    products[i, 1] = prod;
                    products[i, 2] = "drukarka";
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[Produkty](model,typ,producent)" +
                        " VALUES('" + cod + "',' drukarka',' " + prod + "')" );

                }
                i++;
            }

            //---------------- wypisanie danych do tabel PC ,LAPTOP i DRUKARKI---------------
            //zmienne pomocnicze
            int[] ram = new int[]
                { 8,16,32};
            string[] cd = new string[]
                {"x8","x16"};
            int[] hdd = new int[]
                {512,1024,2048 };
            int[] ekran = new int[]
                 {15,17,19,20 };
            int procesor, price, rm, hddmem, screen;
            string dev;
            //zmienne pomocnicze do drukarek
            string[] type = new string[]
                {"laser","atrament"};
            byte[] color = new byte[]
                {0,1};
            byte tcol;
            i = 0;
            while (l > i)
            {

                if (i <= (l / 3))//wpisywanie do tabeli PC
                {
                    procesor = (20 + rand.Next(20)) * 100;
                    rm = ram[rand.Next(ram.Length)];
                    hddmem = hdd[rand.Next(hdd.Length)];
                    dev = cd[rand.Next(cd.Length)];
                    screen = ekran[rand.Next(ekran.Length)];
                    price = (procesor - 1000) + rm * 20 + hddmem / 100 + screen * 30;
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[PC]" +
                        " VALUES('" + products[i, 0] + "', " + procesor + ", " + rm + "," + hddmem + ",'"
                        + dev + "'," + screen + "," + price + ")");
                }
                else if ((i >= (l / 3)) & (i <= (2 * l / 3))) // wpisywanie danych do tabeli laptop
                {
                    procesor = (20 + rand.Next(20)) * 100;
                    rm = ram[rand.Next(ram.Length)];
                    hddmem = hdd[rand.Next(hdd.Length)];

                    screen = ekran[rand.Next(ekran.Length)];
                    price = (procesor - 1000) + rm * 20 + hddmem / 100 + screen * 30;
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[LAPTOP]" +
                        " VALUES('" + products[i, 0] + "', " + procesor + ", " + rm + "," + hddmem + ","
                         + screen + "," + price + ")");
                }



                else if ((i >= (2 * l / 3)))
                {
                    dev = type[rand.Next(type.Length)];
                    tcol = color[rand.Next(color.Length)];
                    price = (50 + rand.Next(40)) * 10;
                    fwrite.WriteLine("INSERT INTO [FirmaKomputerowa].[dbo].[DRUKARKA]" +
                        " VALUES('" + products[i, 0] + "'," + tcol + ",'" + dev+"',"+price);

                }
               

                i++;
            }
            fwrite.Close();
            fout.Close();

        }
    };
    class Program
    {
        static void Main(string[] args)
        {
            int lpr = 60;
            Inserts_zaj i1 = new Inserts_zaj();
            Inserts_zaj i2 = new Inserts_zaj();
            i1.Save(lpr);
            i2.Save(lpr);
            Console.ReadKey(true);

        }
    }
}
