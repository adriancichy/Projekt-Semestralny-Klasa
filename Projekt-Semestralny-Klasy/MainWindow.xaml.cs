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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Projekt_Szkola
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SzkolaEntities BazaDanych = new SzkolaEntities();
        Klasa EdytowanaKlasa;

        public MainWindow()
        {
            InitializeComponent();
            for (char litera = 'a'; litera <= 'z'; litera++)
            {
                PoleLitera.Items.Add(litera);
            }
            AktualizujListe();
        }

        private void PrzyciskUtworzNowaKlase_Click(object sender, RoutedEventArgs e)
        {
            PrzyciskZapisz.Content = "Utwórz";
        }

        private void ListaKlasy_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            EdytowanaKlasa = (Klasa) ListaKlasy.SelectedItem;
            if (EdytowanaKlasa == null)
            {
                PrzyciskZapisz.Content = "Dodaj nową";
                PoleLitera.Text = "";
                PoleImie.Text = "";
                PoleNazwisko.Text = "";
                PoleRocznik.Text = "";
            }
            else
            {
                PrzyciskZapisz.Content = "Zapisz";
                PoleLitera.Text = EdytowanaKlasa.Litera;
                PoleRocznik.Text = EdytowanaKlasa.Rocznik.ToString();
                PoleImie.Text = EdytowanaKlasa.Wychowawca.Imie;
                PoleNazwisko.Text = EdytowanaKlasa.Wychowawca.Nazwisko;
            }
        }

        private void AktualizujListe()
        {
            ListaKlasy.Items.Clear();
            foreach (Klasa klasa in BazaDanych.Klasa)
            {
                ListaKlasy.Items.Add(klasa);
            }
        }

        private void PrzyciskZapisz_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (EdytowanaKlasa == null)
                {
                    Klasa NowaKlasa = new Klasa();
                    NowaKlasa.Litera = PoleLitera.Text;
                    NowaKlasa.Rocznik = Int32.Parse(PoleRocznik.Text);
                    Wychowawca Wychowawca = new Wychowawca();
                    Wychowawca.Imie = PoleImie.Text;
                    Wychowawca.Nazwisko = PoleNazwisko.Text;
                    NowaKlasa.Wychowawca = Wychowawca;
                    BazaDanych.Klasa.Add(NowaKlasa);
                    BazaDanych.SaveChanges();
                }
                else
                {
                    EdytowanaKlasa.Litera = PoleLitera.Text;
                    EdytowanaKlasa.Rocznik = Int32.Parse(PoleRocznik.Text);
                    EdytowanaKlasa.Wychowawca.Imie = PoleImie.Text;
                    EdytowanaKlasa.Wychowawca.Nazwisko = PoleNazwisko.Text;
                    BazaDanych.SaveChanges();
                }
                AktualizujListe();
            } catch (Exception ex)
            {
                MessageBox.Show("Błędne dane");
            }
        }

        private void PrzyciskEdytujUczniow_Click(object sender, RoutedEventArgs e)
        {
        }
    }
}
