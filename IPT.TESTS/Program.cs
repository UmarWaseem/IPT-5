using IPT.Database.HelperClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IPT.TESTS
{
    public class Program
    {
        public static void Main() 
        {
            StudentHelper stdhelper = new StudentHelper();
            stdhelper.AddStudent("EP-1850134","Umar","Waseem","Gulshan","UBIT");
        } 
    }
}
