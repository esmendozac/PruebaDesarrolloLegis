﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LegisEVote.ServiciosWeb.ObjetosNegocio
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EVoteEntities1 : DbContext
    {
        public EVoteEntities1()
            : base("name=EVoteEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Eleccion> Elecciones { get; set; }
        public virtual DbSet<Persona> Personas { get; set; }
        public virtual DbSet<PersonaRol> PersonaRols { get; set; }
        public virtual DbSet<Voto> Votos { get; set; }
    }
}
