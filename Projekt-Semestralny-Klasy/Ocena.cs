//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Projekt_Semestralny_Klasy
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ocena
    {
        public int Id { get; set; }
        public int Ocena1 { get; set; }
        public int Id_Ucznia { get; set; }
    
        public virtual Uczen Uczen { get; set; }
    }
}
