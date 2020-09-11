//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class PersonaRol
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PersonaRol()
        {
            this.VotosCandidato = new HashSet<Voto>();
            this.VotosVotante = new HashSet<Voto>();
        }
    
        public int IdPersonaRol { get; set; }
        public int IdPersona { get; set; }
        public string Propuestas { get; set; }
        public string Rol { get; set; }
        public Nullable<int> IdEleccion { get; set; }
    
        public virtual Eleccion Eleccion { get; set; }
        public virtual Persona Persona { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Voto> VotosCandidato { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Voto> VotosVotante { get; set; }
    }
}