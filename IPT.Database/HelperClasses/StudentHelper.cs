using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IPT.Database.HelperClasses
{
    public class StudentHelper
    {
        public List<Student> GetStudents()
        {
            var db = new IPTEntities1();
            var students = db.Students.ToList();
            return students;
        }

        public void AddStudent(string seatNo, string name, string fatherName, string Address, string Department)
        {
            Student std = new Student();
            std.SeatNo = seatNo;
            std.Name = name;
            std.FatherName = fatherName;
            std.Address = Address;
            std.Department = Department;
            var db = new IPTEntities1();
            db.Students.Add(std);
            db.SaveChanges();
            db.Dispose();
        }


    }
}
