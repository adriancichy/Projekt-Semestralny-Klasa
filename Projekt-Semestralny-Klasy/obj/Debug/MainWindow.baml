   M S B A M L   `   `   `  ����T  PProjekt-Semestralny-Klasy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Projekt_SzkolaProjekt_Szkola  5   	       Projekt_Szkola.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Projekt_Szkola     5   	     � Title$  Szkoła��5   	   $��560.965��6   $	��800��6)    � 
ResizeMode$ NoResize=�65   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��200* �6   �� 5      $
��197* �6   .+�5   
   �� -   5         ��Name$ 
ListaKlasy��5      $��10,50,0,271q�6&    J� RenderTransformOrigin$ -0.534,-0.179&�6;   $
��Left=�6a   $	��772��6|   $��2��6�   6�   �� 5   
   -   5         ��Name$ PrzyciskEdytujUczniow��5      $��Edytuj uczniów��60   $
��Left=�6I   $��287.233,313,0,0q�6d   $	��Top=�6}   $��95��6�   $��1��6�   6�   �� 5   
   -   5        $ PrzyciskUtworzNowaKlase��5      $��Utwórz nową klasę��62   $
��Left=�6N   $��	76,21,0,0q�6i   $	��Top=�6|   $	��108��6�   6�   �� 5   
   $��Klasy��6   $
��Left=�6    $��	11,15,0,0q�6;   $	��Top=�6N   $��15(�6f   $
��Bold"�6t   �� 5   
   $��Edycja��6   $
��Left=�6#   $	��134��6>   $��
11,275,0,0q�6K   $	��Top=�6_   $	��455��6w   $��2��6�   .��5      �� $��
Wychowawca��6   $
��Left=�6+   $��87��6F   $��	205,0,0,0q�6R   $	��Top=�6e   $	��232��6}   .��5      �� -   5         ��Name$ PoleImie��5      $
��Left=�6,   $��23��6G   $��	77,10,0,0q�6S    �� TextWrapping$
 Wrap=�6f   $	��Top=�6z   $	��118��6�   5      5      �� 5   
   $��Imię��6   $
��Left=�6   $��231,315,0,0q�6:   $	��Top=�6O   $��50��6g   �� 5   
   $��Nazwisko��6   $
��Left=�6#   $��231,346,0,0q�6>   $	��Top=�6S   �� 5   
   -   5        $ PoleNazwisko��5      $
��Left=�6(   $��23��6C   $��305,346,0,0q�6O   $
 Wrap=�6d   $	��Top=�6x   $	��120��6�   $��2��6�   �� 5   
   -   5        $ PoleRocznik��5      $
��Left=�6'   $��23��6B   $��
85,306,0,0q�6N   $
 Wrap=�6b   $	��Top=�6v   $	��120��6�   �� 5   
   $��Rocznik��6   $
��Left=�6"   $��
20,306,0,0q�6=   $	��Top=�6Q   �� 5   
   $��Litera��6   $
��Left=�6!   $��
20,337,0,0q�6<   $	��Top=�6P   �� 5   
   -   5         ��Name$ 
PoleLitera��5      $
��Left=�6'   $��
85,341,0,0q�6B   $	��Top=�6V   $	��120��6n   �� 5   
   -   5        $ PrzyciskZapisz��5      $��Dodaj nową��6)   $
��Left=�6>   $��
60,379,0,0q�6Y   $	��Top=�6m   $��75��6�   6�   5       5!      