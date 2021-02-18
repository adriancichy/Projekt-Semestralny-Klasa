using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Projekt_Szkola
{
    /// <summary>
    /// Logika interakcji dla klasy OknoUczniowie.xaml
    /// </summary>
    public partial class OknoUczniowie : Window
    {
        Klasa Klasa;
        Uczen EdytowanyUczen;
        SzkolaEntities BazaDanych;


        public OknoUczniowie(Klasa Klasa, SzkolaEntities BazaDanych)
        {
            this.Klasa = Klasa;
            this.BazaDanych = BazaDanych;
            InitializeComponent();
            AktualizujListe();
            EtykietaUczniowieKlasy.Content = "Uczniowie klasy: " + Klasa.ToString();
        }

        private void PrzyciskTworzNowegoUcznia_Click(object sender, RoutedEventArgs e)
        {
            ListaUczniowie.SelectedItem = null;
            EdytowanyUczen = null;
        }

        private void AktualizujListe()
        {

            ListaUczniowie.Items.Clear();
            foreach (Uczen uczen in Klasa.Uczen)
            {
                ListaUczniowie.Items.Add(uczen);
            }
            PoleImie.Text = "";
            PoleNazwisko.Text = "";
            ListaOcen.Items.Clear();
        }

        private void ListaUczniowie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListaUczniowie.SelectedItem == null)
            {
                PrzyciskZapisz.Content = "Dodaj ucznia";
                ListaOcen.Items.Clear();
                PoleImie.Text = "";
                PoleNazwisko.Text = "";
            } 
            else
            {
                EdytowanyUczen = (Uczen) ListaUczniowie.SelectedItem;
                PoleImie.Text = EdytowanyUczen.Imie;
                PoleNazwisko.Text = EdytowanyUczen.Nazwisko;
                ListaOcen.Items.Clear();
                foreach (Ocena ocena in EdytowanyUczen.Ocena)
                {
                    ListaOcen.Items.Add(ocena.Ocena1);
                }
                PrzyciskZapisz.Content = "Zapisz";
            }                
        }

        private void PrzyciskZapisz_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (EdytowanyUczen == null)
                {
                    Uczen NowyUczen = new Uczen();
                    NowyUczen.Imie = PoleImie.Text;
                    NowyUczen.Nazwisko = PoleNazwisko.Text;
                    foreach (int ocenaWartosc in ListaOcen.Items)
                    {
                        Ocena ocena = new Ocena();
                        ocena.Ocena1 = ocenaWartosc;
                        NowyUczen.Ocena.Add(ocena);
                    }
                    BazaDanych.Uczen.Add(NowyUczen);
                    Klasa.Uczen.Add(NowyUczen);
                }
                else
                {
                    EdytowanyUczen.Imie = PoleImie.Text;
                    EdytowanyUczen.Nazwisko = PoleNazwisko.Text;
                    List<Ocena> poprzednieOceny = EdytowanyUczen.Ocena.ToList();
                    foreach (Ocena ocena in poprzednieOceny)
                    {
                        BazaDanych.Ocena.Remove(ocena);
                    }
                    foreach (int ocenaWartosc in ListaOcen.Items)
                    {
                        Ocena ocena = new Ocena();
                        ocena.Ocena1 = ocenaWartosc;
                        EdytowanyUczen.Ocena.Add(ocena);
                    }
                }
                BazaDanych.SaveChanges();
                AktualizujListe();
            }catch (Exception ex)
            {
                MessageBox.Show("Błędne dane");
            }
        }

        private void PrzyciskUsunOcene_Click(object sender, RoutedEventArgs e)
        {
            if (ListaOcen.SelectedItem != null)
            {
                ListaOcen.Items.Remove(ListaOcen.SelectedItem);
            }
        }

        private void PrzyciskDodajOcene_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ListaOcen.Items.Add(Int32.Parse(PoleOcena.Text));
                PoleOcena.Text = "";
            }catch(Exception ex)
            {
                MessageBox.Show("Błędne dane");
            }
        }
    }
}
