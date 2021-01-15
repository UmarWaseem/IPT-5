<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsExample.aspx.cs" Inherits="IPT.ServerSide.StudentsExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Seat Number : </td>
                    <td>
                        <input type="text" id="seatNo" />
                    </td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td>
                        <input type="text" id="name" />
                    </td>
                </tr>
                <tr>
                    <td>Father Name</td>
                    <td>
                        <input type="text" id="fatherName" />
                    </td>
                </tr>
                <tr>
                    <td>Address : </td>
                    <td>
                        <input type="text" id="address" />
                    </td>
                </tr>
                <tr>
                    <td>Department : </td>
                    <td>
                        <input type="text" id="department" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span onclick="addStudent()">Submit</span>
                    </td>
                </tr>
            </table>
        </div>
    </form>


    <table class="myTable">
  <tr class="tr">
    <th>Seat No.</th>
    <th>Name</th>
    <th>Father name</th>
    <th> Address</th>
    <th>Department</th>
   
  </tr>
       

</table>

    <script>
        function addStudent()
        {
            var SeatNo = $('#seatNo').val();
            var Name = $('#name').val();
            var FatherName = $('#fatherName').val();
            var Address = $('#address').val();
            var Department = $('#department').val();

            var student = new Object();
            student.SeatNo = SeatNo;
            student.Name = Name;
            student.FatherName = FatherName;
            student.Address = Address;
            student.Department = Department;
            //console.log(student);

            var studentStr = JSON.stringify(student);

            $.ajax({
                type: "GET",
                url: "StudentsExample.aspx/AddStudent",
                contentType: "application/JSON",
                data:
                {
                    student: studentStr
                },
                success: function (result) {

                    var array = JSON.parse(result.d);
                    var node = $(".tr");
                    //node.innerHTML = "";
                    var dataTr = $(".dataTr");
                    if (dataTr.length) {
                        
                    dataTr.forEach(el => el.remove())
                    }
                    array.forEach(el => {
                        node.after(`
                        <tr class="dataTr">
                        <td>
                        ${el.seatNo}
                        </td>
<td>
                        ${el.name}
                        </td><td>
                        ${el.fatherName}
                        </td><td>
                        ${el.address}
                        </td><td>
                        ${el.department}
                        </td>
                        </tr>
`)
                    })

                } 
            });
        }
    </script>
</body>
</html>
