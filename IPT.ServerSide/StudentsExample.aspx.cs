using IPT.Database.HelperClasses;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPT.ServerSide
{
    public partial class StudentsExample : System.Web.UI.Page
    {
        static StudentHelper StudentHelper;
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentHelper = new StudentHelper();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public static string AddStudent()
        {
            var studentStr = HttpContext.Current.Request["student"];

            var student = JsonConvert.DeserializeObject<StudentModel>(studentStr);

            StudentHelper.AddStudent(student.seatNo,student.name,student.fatherName,student.address,student.department);

            var allrecords = StudentHelper.GetStudents();

            var allRecordsConverted = new List<StudentModel>();
            foreach (var r in allrecords)
            {
                StudentModel s = new StudentModel();
                s.seatNo = r.SeatNo;
                s.name = r.Name;
                s.fatherName = r.FatherName;
                s.address = r.Address;
                s.department = r.Department;

                allRecordsConverted.Add(s);
            }
            var allRecordStr = JsonConvert.SerializeObject(allRecordsConverted);
            return allRecordStr;
        }

        public class StudentModel
        {
            public string seatNo { get; set; }
            public string name { get; set; }
            public string fatherName { get; set; }
            public string address { get; set; }
            public string department { get; set; }
        }
    }
}