using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LegisEVote.ServiciosWeb.ObjetosNegocio;

namespace LegisEVote.ServiciosWeb.Controllers
{
    public class PersonasController : ApiController
    {
        //Acceso a datos 
        EVoteEntities1 dc = new EVoteEntities1();

        [HttpPost]
        [Route("api/Persona/Votante")]
        public dynamic PostVotante(Persona persona)
        {            
            string mensaje = "El (los) campo(s) falta(n)";

            bool rechazarRegistro = false;

            if (string.IsNullOrEmpty(persona.Nombres))
            { 
                mensaje += "Nombres, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.Apellidos))
            { 
                mensaje += "Apellidos, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.Email))
            { 
                mensaje += "Email, ";
                rechazarRegistro = true;
            }
            if (persona.FechaNacimiento != null)
            { 
                mensaje += "Fecha de nacimiento, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.NumeroIdentificacion))
            { 
                mensaje += "Numero de identificación, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.TipoIdentificacion))
            { 
                mensaje += "Tipo de identificación, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.Sexo))
            { 
                mensaje += "Sexo, ";
                rechazarRegistro = true;
            }
            if (string.IsNullOrEmpty(persona.Contrasena))
            {
                mensaje += "Contraseña, ";
                rechazarRegistro = true;
            }

            //Consulta si la persona existe en la base de datos
            Persona personaExistente = this.dc.Personas.Where(p => p.NumeroIdentificacion == persona.NumeroIdentificacion || p.Email == persona.Email).FirstOrDefault();

            if(personaExistente != null)
                throw new Exception("El votante ya existe en sistema");

            if(rechazarRegistro)
                throw new Exception(mensaje);

            //Crea una persona en la tabla 
            try
            {
                this.dc.Personas.Add(persona);

                this.dc.SaveChanges();

                return Ok();
            }
            catch (Exception ex) 
            {
                throw new Exception("No se pudo crear el votante", ex);
            }
        }
    }
}
