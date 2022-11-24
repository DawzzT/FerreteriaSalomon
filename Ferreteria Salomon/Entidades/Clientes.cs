using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Clientes
    {
        public int Id_Cliente  {get; set;}
        public string  PNC { get; set;}    
        public string  SNC { get; set;}
        public string PAC { get; set; }
        public string SAC { get; set; }
        public int Id_Mun { get; set;}
        public string Dirc { get; set; }   
        public string TelC { get; set; }   
        public string Email { get; set; }
        public bool EstadoC { get; set; }

    }
}
