using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ChurchWebApp
{

    public partial class home_page : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ChurchDB;Integrated Security=True"); //created a connection to the ParishDB
        private List<string> numbersDataList = new List<string>();

        public string sqlwherestatments = "";

        protected void Page_Load(object sender, EventArgs e)
        {  
            fillgridview(); //read the Parish table and display the select all outpuy upon page load
   
        }

        void fillgridview()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from ParishTable" + "", con); // we want the grid to read the entire tabel, which is all the Parish data data
            sqlDa.SelectCommand.CommandType = CommandType.Text;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind(); //all this page does is load the correct data grid if theres any data in them, it will still load, the grid juts wont show if theres no rows
        }

        protected void Button1_Click(object sender, EventArgs e)//below is the button method/code for ADDING a user in
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("INSERT INTO ParishTable" + " VALUES (@personFirstName, @personLastName, @personAge, @gender, @dateOfBirth, @contactNumber, @email, @houseNumber, @roadName, @suburb, @Occupation, @TimeAndTalents, @PreferredMassTime, @stewardship)", con); //insert details into that account table, i think empties are alowwed for now
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Parameters.AddWithValue("@personFirstName", firstnametb.Text); // the script's parameters, add it cause its a value, and add what im using to point at
            sqlCmd.Parameters.AddWithValue("@personLastName", lastnametb.Text);
            sqlCmd.Parameters.AddWithValue("@personAge", agetb.Text);
            sqlCmd.Parameters.AddWithValue("@gender", gendertb.Text);
            sqlCmd.Parameters.AddWithValue("@dateOfBirth", dateofbirthtb.Text);
            sqlCmd.Parameters.AddWithValue("@contactNumber", contactnumbertb.Text);
            sqlCmd.Parameters.AddWithValue("@email", emailtb.Text);
            sqlCmd.Parameters.AddWithValue("@houseNumber", housenumbertb.Text);
            sqlCmd.Parameters.AddWithValue("@roadName", roadnametb.Text);
            sqlCmd.Parameters.AddWithValue("@suburb", suburbtb.Text);
            sqlCmd.Parameters.AddWithValue("@Occupation", occupationtb.Text);
            sqlCmd.Parameters.AddWithValue("@TimeAndTalents", timeandtalentstb.Text);
            sqlCmd.Parameters.AddWithValue("@PreferredMassTime", preferedmasstimetb.Text);
            sqlCmd.Parameters.AddWithValue("@stewardship", stewardshiptb.Text);
            sqlCmd.ExecuteNonQuery(); //execute the sql command
            con.Close(); //close the connecton (so no crashes happen)
            fillgridview(); //load the grid, select all from parish table
            Clear();
        }

        

        protected void deletebtn_Click(object sender, EventArgs e)
        {
              if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlCommand sqlcmd = new SqlCommand("delete from ParishTable where personID = '" + personidtb.Text + "'" + " and personFirstName = '" + Firstname2tb.Text + "'" + " ", con); //using an SQL statament to delete from the table, uses ID and first name
            sqlcmd.CommandType = CommandType.Text;
                sqlcmd.ExecuteNonQuery();
                con.Close();
                fillgridview();//for refreshing and flow purposes
                Clear();
        }

        protected void searchbtn_Click(object sender, EventArgs e) //SEARCHING
        {

            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand sqlcmd = new SqlCommand("select * from ParishTable WHERE 1=1", con);

            //the sql
            if (!string.IsNullOrWhiteSpace(firstnametb.Text))
                sqlcmd.CommandText += " AND personFirstName = @personFirstName";
            if (!string.IsNullOrWhiteSpace(lastnametb.Text))
                sqlcmd.CommandText += " AND personLastName = @personLastName";
            if (!string.IsNullOrWhiteSpace(agetb.Text))
                sqlcmd.CommandText += " AND personAge = @personAge";
            if (!string.IsNullOrWhiteSpace(gendertb.Text))
                sqlcmd.CommandText += " AND gender = @gender";
            if (!string.IsNullOrWhiteSpace(dateofbirthtb.Text))
                sqlcmd.CommandText += " AND dateOfBirth = @dateOfBirth";
            if (!string.IsNullOrWhiteSpace(contactnumbertb.Text))
                sqlcmd.CommandText += " AND contactNumber = @contactNumber";
            if (!string.IsNullOrWhiteSpace(emailtb.Text))
                sqlcmd.CommandText += " AND email = @email";
            if (!string.IsNullOrWhiteSpace(housenumbertb.Text))
                sqlcmd.CommandText += " AND houseNumber = @houseNumber";
            if (!string.IsNullOrWhiteSpace(roadnametb.Text))
                sqlcmd.CommandText += " AND roadName = @roadName";
            if (!string.IsNullOrWhiteSpace(suburbtb.Text))
                sqlcmd.CommandText += " AND suburb = @suburb";
            if (!string.IsNullOrWhiteSpace(occupationtb.Text))
                sqlcmd.CommandText += " AND Occupation = @Occupation";
            if (!string.IsNullOrWhiteSpace(timeandtalentstb.Text))
                sqlcmd.CommandText += " AND TimeAndTalents = @TimeAndTalents";
            if (!string.IsNullOrWhiteSpace(preferedmasstimetb.Text))
                sqlcmd.CommandText += " AND PreferredMassTime = @PreferredMassTime";
            if (!string.IsNullOrWhiteSpace(stewardshiptb.Text))
                sqlcmd.CommandText += " AND stewardship = @stewardship";


            //the parameters
            sqlcmd.Parameters.AddWithValue("@personFirstName", firstnametb.Text); // the script's parameters, add it cause its a value, and add what im using to point at
            sqlcmd.Parameters.AddWithValue("@personLastName", lastnametb.Text);
            sqlcmd.Parameters.AddWithValue("@personAge", agetb.Text);
            sqlcmd.Parameters.AddWithValue("@gender", gendertb.Text);
            sqlcmd.Parameters.AddWithValue("@dateOfBirth", dateofbirthtb.Text);
            sqlcmd.Parameters.AddWithValue("@contactNumber", contactnumbertb.Text);
            sqlcmd.Parameters.AddWithValue("@email", emailtb.Text);
            sqlcmd.Parameters.AddWithValue("@houseNumber", housenumbertb.Text);
            sqlcmd.Parameters.AddWithValue("@roadName", roadnametb.Text);
            sqlcmd.Parameters.AddWithValue("@suburb", suburbtb.Text);
            sqlcmd.Parameters.AddWithValue("@Occupation", occupationtb.Text);
            sqlcmd.Parameters.AddWithValue("@TimeAndTalents", timeandtalentstb.Text);
            sqlcmd.Parameters.AddWithValue("@PreferredMassTime", preferedmasstimetb.Text);
            sqlcmd.Parameters.AddWithValue("@stewardship", stewardshiptb.Text);


            SqlDataAdapter adapter = new SqlDataAdapter(sqlcmd);
            DataTable dtbl = new DataTable();
            adapter.Fill(dtbl);
            con.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Clear();
            personidtb.Text = "";
            Firstname2tb.Text = "";
        }

        public void Clear()
        {   // ckear all fields
            firstnametb.Text = "";
            lastnametb.Text = "";
            agetb.Text = "";
            gendertb.Text = "";
            dateofbirthtb.Text = "";
            contactnumbertb.Text = "";
            emailtb.Text = "";
            housenumbertb.Text = "";
            roadnametb.Text = "";
            suburbtb.Text = "";
            occupationtb.Text = "";
            timeandtalentstb.Text = "";
            preferedmasstimetb.Text = "";
            stewardshiptb.Text = "";
        }

        //ALRIGH NOW FOR THE HARD PART THE MESSAGING PART--------------------------------------//
        
        protected void Button2_Click(object sender, EventArgs e)
        {
        //        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ChurchDB;Integrated Security=True";
        //        string columnName = "contactNumber";

        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();

        //            string query = $"SELECT {columnName} FROM ParishTable";

        //            using (SqlCommand command = new SqlCommand(query, connection))
        //            {
        //                using (SqlDataReader reader = command.ExecuteReader())
        //                {
        //                    while (reader.Read())
        //                    {
        //                        string value = reader[columnName].ToString();
        //                        numbersDataList.Add(value);
        //                    }
        //                }
        //            }
        //        }
        //        // Call the method to display the data in the textbox
        //        DisplayDataInTextBox();  
        }

        //private void DisplayDataInTextBox()
        //{
        //    // Clear the textbox first
        //    //messageTB.Text = "";

        //    StringBuilder sb = new StringBuilder();

        //    // Append each value from the dataList to the textbox
        //    //foreach (string value in numbersDataList)
        //    //{
        //    //    sb.AppendLine(value);
        //    //}

        //    for (int i = 0; i <numbersDataList.Count ;i++ )
        //    {
        //        sb.Append(numbersDataList[i]);
        //        sb.AppendLine();

        //    }

        //    messageTB.Text = sb.ToString();
        //}
        //// so now that we have the forloop working, we just need to add the code to send a message in that loop, from a youtube video, and replace the numbers part with the list element number
    }

}